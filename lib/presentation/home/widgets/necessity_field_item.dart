import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../application/necessity_dynamic_form/necessity_dynamic_form_bloc.dart';
import '../../../domain/necessity/necessity_form.dart';
import '../../../domain/necessity/necessity_objects.dart';
import '../../../shared/utility/currency_range_formatter.dart';
import '../../../shared/utility/main_utility.dart';

class NecessityFieldItem extends StatelessWidget {
  final NecessityForm form;
  NecessityFieldItem({Key? key, required this.form}) : super(key: key);
  final List<String> disbursmentIntervalType = [
    "Tidak tentu",
    "Harian",
    "Mingguan",
    "Bulanan",
    "Darurat"
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (MediaQuery.of(context).size.width > 850) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: _buildNecessityNameField(form, context),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: _buildNecessityAmountField(form, context),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: _buildNecessityType(form, context)),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.remove_circle_outlined,
                  color: Colors.red[400],
                  size: 20,
                ),
                onPressed: () => context
                    .read<NecessityDynamicFormBloc>()
                    .add(NecessityDynamicFormEvent.delete(form.id)),
              )
            ],
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 3,
                  spreadRadius: 1)
            ]),
        child: Column(
          children: [
            _buildNecessityNameField(form, context),
            SizedBox(
              height: 20,
            ),
            _buildNecessityAmountField(form, context),
            SizedBox(
              height: 20,
            ),
            _buildNecessityType(form, context),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              width: double.maxFinite,
              child: IconButton(
                icon: Icon(
                  Icons.remove_circle_outlined,
                  color: Colors.red[400],
                  size: 20,
                ),
                onPressed: () => context
                    .read<NecessityDynamicFormBloc>()
                    .add(NecessityDynamicFormEvent.delete(form.id)),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildNecessityType(NecessityForm form, BuildContext context) {
    return BlocBuilder<NecessityDynamicFormBloc, NecessityDynamicFormState>(
      builder: (context, state) {
        return FormBuilderDropdown<String>(
          name: "form.disbursmentType",
          key: Key("${form.id} type"),
          decoration: InputDecoration(
            labelText: "Jenis Pengeluaran",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          initialValue: form.disbursmentType.getOrNull() ?? "",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          hint: Text(
            "Masukkan jenis pengeluaran",
            style: TextStyle(
                color: Colors.grey[300],
                fontWeight: FontWeight.normal,
                fontSize: 14),
          ),
          icon: Icon(
            Icons.arrow_drop_down_circle_outlined,
            color: Colors.black,
          ),
          items: disbursmentIntervalType
              .map((value) => DropdownMenuItem(
                    value: value,
                    child: Text(
                        "$value ${_textDisbursmentExt(value, form.datetime ?? state.currentDate)}"),
                  ))
              .toList(),
          onChanged: (value) {
            context.read<NecessityDynamicFormBloc>().add(
                  NecessityDynamicFormEvent.update(
                    id: form.id,
                    form: form.copyWith(
                      disbursmentType: NecessityDisbursmentType(value),
                    ),
                  ),
                );
          },
        );
      },
    );
  }

  String _textDisbursmentExt(String value, DateTime date) {
    if (MainUtility.isDisbursmentMatchWith(
        value, DisbursmentIntervalType.Unexpected)) {
      return "(${DateFormat("EEEE, dd MMMM").format(date)})";
    } else if (MainUtility.isDisbursmentMatchWith(
        value, DisbursmentIntervalType.Emergency)) {
      return "(${DateFormat("EEEE, dd MMMM").format(date)})";
    }
    return "";
  }

  TextFormField _buildNecessityAmountField(
      NecessityForm form, BuildContext context) {
    return TextFormField(
      key: Key("${form.id} amount"),
      controller: form.amountCon,
      // initialValue: form.amount.getOrNull().toString(),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter.deny(RegExp(r'^0')),
        CurrencyRangeFormatter(min: 0, max: 0x7fffffff)
      ],
      keyboardType: TextInputType.number,
      onChanged: (v) {
        context.read<NecessityDynamicFormBloc>().add(
            NecessityDynamicFormEvent.update(
                id: form.id,
                form: form.copyWith(
                    amount: NecessityAmount(
                        double.parse(v.replaceAll(RegExp(r"[Rp.]"), ""))))));
      },
      decoration: InputDecoration(
        labelText: 'Nominal',
        hintText: NumberFormat.currency(name: "Rp", decimalDigits: 0)
            .format((form.amount.getOrNull() ?? 0)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }

  TextFormField _buildNecessityNameField(
      NecessityForm form, BuildContext context) {
    return TextFormField(
      key: Key("${form.id} name"),
      controller: form.nameCon,
      onChanged: (v) {
        context.read<NecessityDynamicFormBloc>().add(
            NecessityDynamicFormEvent.update(
                id: form.id, form: form.copyWith(name: NecessityName(v))));
      },
      // initialValue: form.name.getOrNull() ?? "",
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: form.name.getOrNull() ?? "Masukkan nama kebutuhan Anda",
        labelText: 'Nama',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
