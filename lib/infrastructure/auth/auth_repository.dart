import 'dart:async';

import 'package:code_id_storage/code_id_storage.dart';
import 'package:finote/infrastructure/core/constants.dart';
import 'package:finote/infrastructure/user/models/user.dart';
import 'package:finote/infrastructure/user_necessity/models/user_necessity.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../core/cache.dart';

const String AUTH_STATUS = 'auth-status';
const String AUTH_UID = 'auth-uid';

class LogInWithGoogleFailure implements Exception {}

class LogOutFailure implements Exception {}

@lazySingleton
class AuthenticationRepository {
  AuthenticationRepository({
    CacheClient? cache,
    firebase_auth.FirebaseAuth? firebaseAuth,
    SharedPreferences? sharedPreferences,
    GoogleSignIn? googleSignIn,
  })  : _cache = cache ?? CacheClient(),
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _sharedPreferences = sharedPreferences ??
            (SharedPreferences.getInstance() as SharedPreferences);

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final SharedPreferences _sharedPreferences;
  final CacheClient _cache;

  static const userCacheKey = '__user_cache_key__';
  static const userNecessityKey = '__user_necessity_key__';

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      User user = firebaseUser == null ? User.empty() : firebaseUser.toUser;
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  Future<void> saveNecessity(UserNecessity userNecessity) async {
    await Storage.openBox(userNecessityBox);
    await Storage.putDatum(
        key: "data", value: userNecessityToJson(userNecessity));
  }

  saveUser() async {
    await _sharedPreferences.setBool(AUTH_STATUS, true);
    await _sharedPreferences.setString(AUTH_UID, currentUser.id);
  }

  Future<String?>? getId() async {
    var status = _sharedPreferences.getBool(AUTH_STATUS);
    if (!status!) {
      return null;
    }
    return _sharedPreferences.getString(AUTH_UID);
  }

  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty();
  }

  Future<UserNecessity> get getCurrentUserNecessity async {
    var usr = await Storage.getData(key: "data");
    if (usr == null) {
      return UserNecessity.empty();
    }
    return userNecessityFromJson(usr);
  }

  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      saveUser();
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw LogInWithGoogleFailure();
    }
  }

  Future<void> logInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oAuthProvider = firebase_auth.OAuthProvider('apple.com');
      final credential = oAuthProvider.credential(
        idToken: appleCredential.identityToken!,
        accessToken: appleCredential.authorizationCode,
      );
      await _firebaseAuth.signInWithCredential(credential);
      saveUser();
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw LogInWithGoogleFailure();
    }
  }

  Future<void> logInAnonymously() async {
    try {
      await _firebaseAuth.signInAnonymously();
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw LogInWithGoogleFailure();
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
      _cache.write<User>(key: userCacheKey, value: null);
      _cache.write<User>(key: userNecessityKey, value: null);
    } on Exception {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
