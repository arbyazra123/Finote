import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:finote/domain/necessity/necessity_form.dart';
import 'package:finote/domain/necessity/necessity_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../domain/necessity/necessity_form_list.dart';
import '../../infrastructure/user_necessity/models/user_necessity.dart';

part 'necessity_dynamic_form_event.dart';
part 'necessity_dynamic_form_state.dart';
part 'necessity_dynamic_form_bloc.freezed.dart';

@injectable
class NecessityDynamicFormBloc
    extends Bloc<NecessityDynamicFormEvent, NecessityDynamicFormState> {
  NecessityDynamicFormBloc() : super(NecessityDynamicFormState.initial()) {
    on<_SetFromNeeds>(_mapSetFromNeedsToState);
    on<_Add>(_mapAddToState);
    on<_Clear>((event, emit) {
      emit(state.copyWith(
          formList: NecessityFormList(
              id: Uuid().v4(), forms: IList<NecessityForm>())));
    });
    on<_OnDateChanged>((event, emit) {
      emit(state.copyWith(currentDate: event.date));
    });
    on<_Update>(
      (event, emit) {
        emit(
          state.copyWith(
            formList: NecessityFormList(
                id: state.formList.id,
                forms: state.formList.forms.map((element) {
                  if (element.id == event.form.id) {
                    return event.form;
                  }
                  return element;
                }).toIList()),
          ),
        );
      },
    );
    on<_Delete>((event, emit) {
      emit(
        state.copyWith(
          formList: NecessityFormList(
              id: state.formList.id,
              forms: state.formList.forms
                  .removeWhere((element) => element.id == event.id)),
        ),
      );
    });
  }

  FutureOr<void> _mapAddToState(event, emit) {
    emit(state.copyWith(
        formList: NecessityFormList(
      id: Uuid().v4(),
      forms: state.formList.forms.add(NecessityForm.empty()),
    )));
  }

  FutureOr<void> _mapSetFromNeedsToState(_SetFromNeeds event, emit) {
    emit(state.copyWith(
        formList: NecessityFormList(
            id: Uuid().v4(),
            forms: event.needs
                .map(
                  (e) => NecessityForm(
                    datetime:
                        e.datetime != null ? DateTime.parse(e.datetime!) : null,
                    disbursmentType:
                        NecessityDisbursmentType(e.disbursementIntervalType),
                    nameCon: TextEditingController(text: e.name ?? ""),
                    descCon: TextEditingController(text: e.description ?? ""),
                    amountCon: TextEditingController(
                        text: NumberFormat.currency(
                                symbol: "Rp", decimalDigits: 0)
                            .format(e.amount)),
                    id: e.id!,
                    name: NecessityName(e.name ?? ""),
                    amount: NecessityAmount((e.amount ?? 0).toDouble()),
                    description: NecessityDescription(
                      e.description ?? "",
                    ),
                  ),
                )
                .toList()
                .lock)));
  }
}
