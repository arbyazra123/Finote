import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/necessity_dynamic_form/necessity_dynamic_form_bloc.dart';
import '../../../application/user_necessity/user_necessity_bloc.dart';
import 'necessity_field_item.dart';

class NecessityFields extends StatelessWidget {
  const NecessityFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NecessityDynamicFormBloc, NecessityDynamicFormState>(
      builder: (context, formState) {
        return BlocConsumer<UserNecessityBloc, UserNecessityState>(
          listener: (context, state) {
            state.process.maybeWhen(
              success: () {
                // context.read<NecessityDynamicFormBloc>().add(
                //       const NecessityDynamicFormEvent.add(),
                //     );
                if (formState.formList.forms.isEmpty) {
                  context.read<NecessityDynamicFormBloc>().add(
                        const NecessityDynamicFormEvent.add(),
                      );
                  return;
                }
                // if (state.userNecessity.necessity?.isNotEmpty ?? false) {
                //   context.read<NecessityDynamicFormBloc>().add(
                //       NecessityDynamicFormEvent.setFromNeeds(
                //           state.userNecessity.necessity!));
                // }
              },
              orElse: () {
                // context.read<NecessityDynamicFormBloc>().add(
                //       const NecessityDynamicFormEvent.add(),
                //     );
              },
            );
          },
          builder: (context, state) {
            return state.process.maybeWhen(
                error: (msg) =>
                    Center(child: Text(msg ?? "Ups, an error occured")),
                loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                orElse: () => Center(
                      child: Text("Ups, an error occured"),
                    ),
                success: () => formState.formList.forms.isEmpty
                    ? Center(
                        child: Text("Tidak ada kolom kebutuhan"),
                      )
                    : Column(
                        children: [
                          for (var necessity in formState.formList.forms)
                            NecessityFieldItem(form: necessity),
                        ],
                      ));
          },
        );
      },
    );
  }
}
