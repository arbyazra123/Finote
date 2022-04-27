import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:finote/shared/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model_viewer/model_viewer.dart';

import '../../../../application/login/login_cubit.dart';
import '../../../../shared/injector.dart';

class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Finote",
                    style: TextStyle(
                        fontFamily: "Pacifico",
                        fontSize: 50,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Your Financial Note Assistant",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Stack(
              children: [
                ModelViewer(
                  src:
                      'assets/three_d/hi.glb',
                  alt: "A 3D model of an astronaut",
                  ar: true,
                  autoRotate: true,
                  cameraControls: true,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    _buildLoginWithGoogle(context),
                    SizedBox(
                      height: 20,
                    ),
                    _buildLoginWithApple(context),
                    SizedBox(
                      height: 20,
                    ),
                    // _buildLoginAnonymously(context),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginAnonymously(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 45,
      child: ElevatedButton(
        onPressed: () async {
          var isAccept = await showCupertinoDialog<bool>(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text("Anonymous Login"),
              content: Text(
                "Anonymous login wont synchronize your data across devices and behave temporary, are you sure?",
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    "No",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () => Navigator.pop(context, false),
                ),
                CupertinoDialogAction(
                  child: Text("Yes"),
                  onPressed: () async {
                    await AutoRouter.of(context).pop(true);
                  },
                ),
              ],
            ),
          );
          if (isAccept!) {
            context.read<LoginCubit>().logInAnonymously();
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
          Colors.grey[600],
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign in Anonymously",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildLoginWithGoogle(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          context.read<LoginCubit>().logInWithGoogle();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
          Colors.red[700],
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign in with Google",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 8,
            ),
            Image.asset(
              "assets/images/gicon.png",
              width: 25,
              height: 25,
            )
          ],
        ),
      ),
    );
  }

  SizedBox _buildLoginWithApple(BuildContext context) {
    if (kIsWeb) {
      return SizedBox();
    }
    return Platform.isIOS
        ? SizedBox(
            width: 200,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                context.read<LoginCubit>().logInWithApple();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                Colors.white,
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sign in with Apple",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    "assets/images/img_apple.png",
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          )
        : SizedBox();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (context) => getIt<LoginCubit>(), child: this);
  }
}
