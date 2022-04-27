part of 'necessity_dynamic_form_bloc.dart';

@freezed
class NecessityDynamicFormState with _$NecessityDynamicFormState {
  const factory NecessityDynamicFormState({
    required NecessityFormList formList,
    required DateTime currentDate,
    bool? isDataChanged,
  }) = _NecessityDynamicFormState;
  factory NecessityDynamicFormState.initial() => NecessityDynamicFormState(
      currentDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
      formList: NecessityFormList.empty(),
      isDataChanged: false);
}
