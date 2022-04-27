import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'necessity_form.dart';

part 'necessity_form_list.freezed.dart';

@freezed
class NecessityFormList with _$NecessityFormList {
  const factory NecessityFormList({
    required String id,
    required IList<NecessityForm> forms,
  }) = _NecessityFormList;

  factory NecessityFormList.empty() =>
      NecessityFormList(forms: IList<NecessityForm>(), id: "");
}
