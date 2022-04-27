import 'package:date_time_picker/date_time_picker.dart';
import 'package:finote/application/user_necessity/user_necessity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/necessity_dynamic_form/necessity_dynamic_form_bloc.dart';

class AddNecessityAndDate extends StatelessWidget {
  const AddNecessityAndDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserNecessityBloc, UserNecessityState>(
      builder: (context, state) {
        return BlocBuilder<NecessityDynamicFormBloc, NecessityDynamicFormState>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, top: 30, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<NecessityDynamicFormBloc>().add(
                                  NecessityDynamicFormEvent.add(),
                                );
                          },
                          child: Row(children: [
                            Text("Kebutuhan"),
                            SizedBox(width: 9),
                            Icon(
                              Icons.add_circle_outline_outlined,
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30, right: 30, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 180,
                        height: 45,
                        child: DateTimePicker(
                          showCursor: true,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            labelText: 'Tanggal Kebutuhan',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                          type: DateTimePickerType.date,
                          onChanged: (v) {
                            var d = DateTime.parse(v);
                            context.read<NecessityDynamicFormBloc>().add(
                                  NecessityDynamicFormEvent.onDateChanged(
                                      DateTime(d.year, d.month, d.day)),
                                );
                          },
                          dateMask: 'EEEE, dd MMMM',
                          initialValue: state.currentDate.toString(),
                          firstDate: DateTime(DateTime.now().year - 1),
                          lastDate: DateTime.now(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
