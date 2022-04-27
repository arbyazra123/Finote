import 'package:finote/application/necessity_dynamic_form/necessity_dynamic_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../application/user_necessity/user_necessity_bloc.dart';
import '../../../shared/utility/currency_range_formatter.dart';

class SalaryField extends StatelessWidget {
  const SalaryField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NecessityDynamicFormBloc, NecessityDynamicFormState>(
      builder: (context, formState) {
        return BlocBuilder<UserNecessityBloc, UserNecessityState>(
          builder: (context, state) {
            return state.process.maybeWhen(
              success: () {
                return SizedBox(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    onTap: () {
                      context.read<UserNecessityBloc>().add(
                            UserNecessityEvent.updateForm(
                              formList: formState.formList,
                              dateTime: formState.currentDate,
                            ),
                          );
                    },
                    obscureText: state.isSalaryVisible,
                    initialValue:
                        NumberFormat.currency(symbol: "Rp", decimalDigits: 0)
                            .format(state.userNecessity.salary ?? 0),
                    onChanged: (v) {
                      // if()

                      context.read<UserNecessityBloc>().add(
                            UserNecessityEvent.updateSalary(double.parse(
                                v.replaceAll(RegExp(r"[Rp.]"), ""))),
                          );
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp(r'^0')),
                      CurrencyRangeFormatter(min: 0, max: 0x7fffffff)
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            context.read<UserNecessityBloc>().add(
                                  UserNecessityEvent.updateForm(
                                    formList: formState.formList,
                                    dateTime: formState.currentDate,
                                  ),
                                );
                            context.read<UserNecessityBloc>().add(
                                UserNecessityEvent.toggleSalaryVisbility());
                          },
                          icon: (!state.isSalaryVisible)
                              ? Icon(
                                  Icons.visibility,
                                  color: Colors.blue,
                                )
                              : Icon(Icons.visibility_off)),
                      labelText: 'Gaji Anda',
                      hintText: 'Rp...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                );
              },
              orElse: () {
                return SizedBox(
                  width: 200,
                  child: TextFormField(
                    obscureText: state.isSalaryVisible,
                    onChanged: (v) {
                      context.read<UserNecessityBloc>().add(
                            UserNecessityEvent.updateSalary(double.parse(
                                v.replaceAll(RegExp(r"[Rp.]"), ""))),
                          );
                      context.read<UserNecessityBloc>().add(
                            UserNecessityEvent.updateSalary(double.parse(
                                v.replaceAll(RegExp(r"[Rp.]"), ""))),
                          );
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp(r'^0')),
                      CurrencyRangeFormatter(min: 0, max: 0x7fffffff)
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () => context
                              .read<UserNecessityBloc>()
                              .add(UserNecessityEvent.toggleSalaryVisbility()),
                          icon: (!state.isSalaryVisible)
                              ? Icon(
                                  Icons.visibility,
                                  color: Colors.blue,
                                )
                              : Icon(Icons.visibility_off)),
                      labelText: 'Masukkan Gaji Anda',
                      hintText: 'Rp...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                );
              },
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }
}
