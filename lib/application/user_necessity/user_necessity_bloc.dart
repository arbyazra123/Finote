import 'package:fpdart/fpdart.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finote/domain/core/result_state.dart';
import 'package:finote/domain/necessity/necessity_form_list.dart';
import 'package:finote/infrastructure/auth/auth_repository.dart';
import 'package:finote/infrastructure/core/constants.dart';
import 'package:finote/infrastructure/user_necessity/models/user_necessity.dart';
import 'package:finote/shared/injector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
// ignore: unused_import
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../shared/utility/main_utility.dart';

part 'user_necessity_event.dart';
part 'user_necessity_state.dart';
part 'user_necessity_bloc.freezed.dart';

@injectable
class UserNecessityBloc extends Bloc<UserNecessityEvent, UserNecessityState> {
  final AuthenticationRepository _authRepository;
  UserNecessityBloc(this._authRepository)
      : super(UserNecessityState.initial()) {
    on<_ToggleSalaryVisbility>((event, emit) async {
      emit(state.copyWith(
        isSalaryVisible: !state.isSalaryVisible,
      ));
    });
    on<_DeleteById>((event, emit) async {
      emit(state.copyWith(process: ResultState.loading()));
      var usr = await _authRepository.getCurrentUserNecessity;
      var newNecessity = state.userNecessity.necessity;
      newNecessity?.removeWhere(
        (element) => element.id == event.id,
      );
      var newUserNecessity = state
          .copyWith(
              userNecessity: state.userNecessity.copyWith(
            id: usr.id,
            salary: usr.salary,
            necessity: newNecessity,
          ))
          .userNecessity;
      await FirebaseFirestore.instance
          .collection(userNecessityCol)
          .doc(usr.id)
          .set(newUserNecessity.toJson());
      emit(state.copyWith(
        process: ResultState.success(),
        userNecessity: newUserNecessity,
      ));
    });
    on<_Save>((event, emit) async {
      emit(state.copyWith(process: ResultState.loading()));
      try {
        if (state.userNecessity.id.isEmpty) {
          var usr = await _authRepository.getCurrentUserNecessity;
          var newUser = state
              .copyWith(
                  userNecessity: state.userNecessity.copyWith(
                id: usr.id,
                salary: usr.salary,
                necessity: state.userNecessity.necessity,
              ))
              .userNecessity;
          await FirebaseFirestore.instance
              .collection(userNecessityCol)
              .doc(newUser.id)
              .set(newUser.toJson());
          emit(state.copyWith(process: ResultState.success()));
        } else {
          var existingNecessity =
              (await _authRepository.getCurrentUserNecessity).necessity;
          var newUser = state.copyWith(
              userNecessity: state.userNecessity.copyWith(
            id: state.userNecessity.id,
            salary: state.userNecessity.salary,
            necessity: [
              ...?existingNecessity,
              ...?state.userNecessity.necessity
            ],
          ));
          await FirebaseFirestore.instance
              .collection(userNecessityCol)
              .doc(state.userNecessity.id)
              .update(newUser.userNecessity.toJson());

          emit(state.copyWith(
            process: ResultState.success(),
            userNecessity: newUser.userNecessity.copyWith(
              necessity: [],
            ),
          ));
        }
      } on Exception catch (e) {
        emit(state.copyWith(process: ResultState.error(e.toString())));
      }
    });
    on<_UpdateSalary>((event, emit) async {
      emit(state.copyWith(
        userNecessity: state.userNecessity.copyWith(
          salary: event.salary,
        ),
      ));
    });
    on<_UpdateForm>((event, emit) async {
      try {
        if (state.userNecessity.necessity?.isNotEmpty ?? false) {
          emit(
            state.copyWith(
              userNecessity: state.userNecessity.copyWith(
                necessity: event.formList.forms
                    .map(
                      (element) => Necessity(
                        datetime: element.datetime != null
                            ? (element.datetime.toString())
                            : event.dateTime.toString(),
                        description: element.description.getOrNull(),
                        disbursementIntervalType:
                            element.disbursmentType.getOrNull(),
                        id: element.id,
                        name: element.name.getOrNull(),
                        amount: element.amount.getOrNull(),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        } else {
          var data = event.formList.forms
              .map(
                (element) => Necessity(
                  datetime: event.dateTime.toString(),
                  description: element.descCon.text,
                  disbursementIntervalType: element.disbursmentType.getOrNull(),
                  id: element.id,
                  name: element.name.getOrNull(),
                  amount: element.amount.getOrNull(),
                ),
              )
              .toList();
          emit(state.copyWith(
              userNecessity: state.userNecessity.copyWith(necessity: data)));
        }
      } catch (e) {
        getIt<Logger>().e(e);
        emit(state.copyWith(process: ResultState.error(e.toString())));
      }
    });
    on<_Initialize>((event, emit) async {
      emit(state.copyWith(process: ResultState.loading()));
      if (_authRepository.currentUser.id.isNotEmpty) {
        var user = await FirebaseFirestore.instance
            .collection("user_necessity")
            .where("uid", isEqualTo: _authRepository.currentUser.id)
            .get();
        if (user.docs.first.exists) {
          var userNecessity = UserNecessity.fromJson(user.docs.first.data());
          await _authRepository.saveNecessity(userNecessity);
          return emit(state.copyWith(
              userNecessity: userNecessity,
              process: ResultState.success(),
              isSalaryVisible: (userNecessity.salary ?? 0) != 0));
        } else {
          var newUserNecessity = UserNecessity(
            uid: _authRepository.currentUser.id,
            necessity: [],
            salary: 0,
            id: Uuid().v4(),
          );
          var addedData = await FirebaseFirestore.instance
              .collection(userNecessityCol)
              .add(newUserNecessity.toJson());
          await FirebaseFirestore.instance
              .collection(userNecessityCol)
              .doc(addedData.id)
              .update({
            "id": addedData.id,
          });
          await _authRepository
              .saveNecessity(newUserNecessity.copyWith(id: addedData.id));
          return add(_Get());
        }
      }
      emit(state.copyWith(
        process: ResultState.error("Ups, coba refresh halaman ini"),
        isSalaryVisible: false,
      ));
    });
    on<_Get>((event, emit) async {
      try {
        emit(state.copyWith(process: ResultState.loading()));

        var data = await FirebaseFirestore.instance
            .collection("user_necessity")
            .where("uid", isEqualTo: _authRepository.currentUser.id)
            .get();
        if (data.docs.isNotEmpty) {
          var userNecessity = UserNecessity.fromJson(data.docs.first.data());
          await _authRepository.saveNecessity(userNecessity);
          emit(state.copyWith(
              userNecessity: userNecessity,
              process: ResultState.success(),
              isSalaryVisible: (userNecessity.salary ?? 0) != 0));
        } else {
          emit(state.copyWith(
            process: ResultState.error(null),
            isSalaryVisible: false,
          ));
        }
      } on Exception catch (e) {
        emit(state.copyWith(
          process: ResultState.error("Error : ${e.toString()}"),
          isSalaryVisible: false,
        ));
      }
    });
    on<_GetByDate>((event, emit) async {
      try {
        emit(state.copyWith(process: ResultState.loading()));

        // var data = await FirebaseFirestore.instance
        //     .collection("user_necessity")
        //     .where("uid", isEqualTo: _authRepository.currentUser.id)
        //     .get();
        // if (data.docs.isNotEmpty) {
        //   var userNecessity = UserNecessity.fromJson(data.docs.first.data());

        emit(state.copyWith(
            userNecessity: event.userNecessity.copyWith(
                necessity: event.userNecessity.necessity?.where((e) {
              var d = DateTime.parse(e.datetime ?? DateTime.now().toString());
              if (DateTime(
                d.year,
                d.month,
              ).isAtSameMomentAs(DateTime(
                event.dateTime.year,
                event.dateTime.month,
              ))) {
                if (MainUtility.isDisbursmentMatchWith(
                    e.disbursementIntervalType ?? "",
                    DisbursmentIntervalType.Daily)) {
                  return true;
                } else if (MainUtility.isDisbursmentMatchWith(
                        e.disbursementIntervalType ?? "",
                        DisbursmentIntervalType.Monthly) &&
                    event.dateTime.day == 1) {
                  return true;
                } else if (MainUtility.isDisbursmentMatchWith(
                        e.disbursementIntervalType ?? "",
                        DisbursmentIntervalType.Weekly) &&
                    (event.dateTime.day % 7) == 0) {
                  return true;
                } else if (MainUtility.isDisbursmentMatchWith(
                        e.disbursementIntervalType ?? "",
                        DisbursmentIntervalType.Unexpected) &&
                    d.day == event.dateTime.day) {
                  return true;
                } else if (MainUtility.isDisbursmentMatchWith(
                        e.disbursementIntervalType ?? "",
                        DisbursmentIntervalType.Emergency) &&
                    d.day == event.dateTime.day) {
                  return true;
                } else {
                  return false;
                }
              } else {
                return false;
              }
            }).toList()),
            process: ResultState.success(),
            isSalaryVisible: (event.userNecessity.salary ?? 0) != 0));
        // } else {
        //   emit(state.copyWith(
        //     process: ResultState.error(null),
        //     isSalaryVisible: false,
        //   ));
        // }
      } on Exception catch (e) {
        emit(state.copyWith(
          process: ResultState.error("Error : ${e.toString()}"),
          isSalaryVisible: false,
        ));
      }
    });
  }
}
