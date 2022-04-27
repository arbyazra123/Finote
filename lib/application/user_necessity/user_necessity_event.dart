part of 'user_necessity_bloc.dart';

@freezed
class UserNecessityEvent with _$UserNecessityEvent {
  const factory UserNecessityEvent.initialize() = _Initialize;
  const factory UserNecessityEvent.get() = _Get;
  const factory UserNecessityEvent.deleteById(String id) = _DeleteById;
  const factory UserNecessityEvent.getByDate({required DateTime dateTime, required UserNecessity userNecessity}) = _GetByDate;
  const factory UserNecessityEvent.toggleSalaryVisbility() =
      _ToggleSalaryVisbility;
  const factory UserNecessityEvent.updateForm({
    required NecessityFormList formList,
    required DateTime dateTime,
  }) = _UpdateForm;
  const factory UserNecessityEvent.updateSalary(double salary) = _UpdateSalary;
  const factory UserNecessityEvent.save() = _Save;
}
