import 'package:code_id_flutter/code_id_flutter.dart';
import 'package:finote/domain/core/failures.dart';
import 'package:fpdart/src/either.dart';

class NecessityName extends ValueObject<ValueFailure, String> {
  @override
  final Either<ValueFailure, String> value;

  const NecessityName._(this.value);

  factory NecessityName.initial() => NecessityName._(right(""));

  factory NecessityName(String? value) {
    assert(value != null);
    if (value != null && value.isNotEmpty) {
      return NecessityName._(
        Either.right(
          value,
        ),
      );
    }
    return NecessityName._(
      Either.left(
        ValueFailure.empty(failedValue: value),
      ),
    );
  }
}

class NecessityAmount extends ValueObject<ValueFailure, double> {
  @override
  final Either<ValueFailure, double> value;

  const NecessityAmount._(this.value);

  factory NecessityAmount.initial() => NecessityAmount._(right(0));

  factory NecessityAmount(double? value) {
    assert(value != null);
    if (value != null) {
      return NecessityAmount._(
        Either.right(
          value,
        ),
      );
    }
    return NecessityAmount._(
      Either.left(
        ValueFailure.empty(failedValue: value),
      ),
    );
  }
}

class NecessityDescription extends ValueObject<ValueFailure, String> {
  @override
  final Either<ValueFailure, String> value;

  const NecessityDescription._(this.value);

  factory NecessityDescription.initial() => NecessityDescription._(right(""));

  factory NecessityDescription(String? value) {
    assert(value != null);
    if (value != null && value.isNotEmpty) {
      return NecessityDescription._(
        Either.right(
          value,
        ),
      );
    }
    return NecessityDescription._(
      Either.left(
        ValueFailure.empty(failedValue: value),
      ),
    );
  }
}

class NecessityDisbursmentType extends ValueObject<ValueFailure, String> {
  @override
  final Either<ValueFailure, String> value;

  const NecessityDisbursmentType._(this.value);

  factory NecessityDisbursmentType.initial() =>
      NecessityDisbursmentType._(right(""));

  factory NecessityDisbursmentType(String? value) {
    assert(value != null);
    if (value != null && value.isNotEmpty) {
      return NecessityDisbursmentType._(
        Either.right(
          value,
        ),
      );
    }
    return NecessityDisbursmentType._(
      Either.left(
        ValueFailure.empty(failedValue: value),
      ),
    );
  }
}
