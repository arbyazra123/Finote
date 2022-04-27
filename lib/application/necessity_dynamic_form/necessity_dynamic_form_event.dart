part of 'necessity_dynamic_form_bloc.dart';

@freezed
class NecessityDynamicFormEvent with _$NecessityDynamicFormEvent {
  const factory NecessityDynamicFormEvent.started() = _Started;
  const factory NecessityDynamicFormEvent.clear() = _Clear;
  const factory NecessityDynamicFormEvent.onDateChanged(DateTime date) = _OnDateChanged;
  const factory NecessityDynamicFormEvent.setFromNeeds(List<Necessity> needs) =
      _SetFromNeeds;
  const factory NecessityDynamicFormEvent.add() = _Add;
  const factory NecessityDynamicFormEvent.update(
      {required String id, required NecessityForm form}) = _Update;
  const factory NecessityDynamicFormEvent.delete(String id) = _Delete;
}