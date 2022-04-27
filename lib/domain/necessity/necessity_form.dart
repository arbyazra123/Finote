import 'package:finote/domain/necessity/necessity_objects.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'necessity_form.freezed.dart';

@freezed
class NecessityForm with _$NecessityForm {
  const factory NecessityForm({
    required String id,
    required TextEditingController nameCon,
    required TextEditingController amountCon,
    required TextEditingController descCon,
    required NecessityName name,
    required NecessityAmount amount,
    required NecessityDescription description,
    required NecessityDisbursmentType disbursmentType,
    DateTime? datetime,
  }) = _NecessityForm;

  factory NecessityForm.empty() => NecessityForm(
        id: Uuid().v4(),
        name: NecessityName(""),
        nameCon: TextEditingController(),
        amountCon: TextEditingController(),
        descCon: TextEditingController(),
        amount: NecessityAmount(0),
        description: NecessityDescription(""),
        disbursmentType: NecessityDisbursmentType("Tidak tentu"),
      );
}
