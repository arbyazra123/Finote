// import 'package:date_time_picker/date_time_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../application/user_necessity/user_necessity_bloc.dart';
// import '../../../shared/utility/currency_range_formatter.dart';

// Future<dynamic> _showAdditionalNeedField(BuildContext context) {
//   return showCupertinoDialog(
//     context: context,
//     builder: (context) => StatefulBuilder(
//       builder: (context, setState) => Material(
//         color: Colors.transparent,
//         child: CupertinoDialogAction(
//           child: Container(
//             padding: EdgeInsets.all(30),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     TextFormField(
//                       // onChanged: (v) {
//                       //   context.read<UserNecessityBloc>().add(
//                       //         UserNecessityEvent.updateSalary(double.parse(
//                       //             v.replaceAll(RegExp(r"[Rp.]"), ""))),
//                       //       );
//                       // },
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         // suffixIcon: IconButton(
//                         //     onPressed: () => context
//                         //         .read<UserNecessityBloc>()
//                         //         .add(UserNecessityEvent.toggleSalaryVisbility()),
//                         //     icon: (state.isSalaryVisible)
//                         //         ? Icon(Icons.visibility)
//                         //         : Icon(Icons.visibility_off)),
//                         labelText: 'Nama Pengeluaran',
//                         hintText: 'Rp...',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       onChanged: (v) {
//                         context.read<UserNecessityBloc>().add(
//                               UserNecessityEvent.updateSalary(double.parse(
//                                   v.replaceAll(RegExp(r"[Rp.]"), ""))),
//                             );
//                       },
//                       inputFormatters: [
//                         FilteringTextInputFormatter.digitsOnly,
//                         FilteringTextInputFormatter.deny(RegExp(r'^0')),
//                         CurrencyRangeFormatter(min: 0, max: 0x7fffffff)
//                       ],
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         // suffixIcon: IconButton(
//                         //     onPressed: () => context
//                         //         .read<UserNecessityBloc>()
//                         //         .add(UserNecessityEvent.toggleSalaryVisbility()),
//                         //     icon: (state.isSalaryVisible)
//                         //         ? Icon(Icons.visibility)
//                         //         : Icon(Icons.visibility_off)),
//                         labelText: 'Jumlah Pengeluaran',
//                         hintText: 'Rp...',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(5)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     DateTimePicker(
//                       decoration: InputDecoration(
//                         labelText: 'Tanggal Pengeluaran',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(5)),
//                         ),
//                       ),
//                       timeHintText: "Masukkan tanggal pengeluaran Anda",
//                       type: DateTimePickerType.date,
//                       dateMask: 'EEEE, dd MMMM',
//                       initialValue: DateTime.now().toString(),
//                       firstDate: DateTime(DateTime.now().year - 1),
//                       lastDate: DateTime.now(),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     DateTimePicker(
//                       decoration: InputDecoration(
//                         labelText: 'Waktu Pengeluaran',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(5)),
//                         ),
//                       ),
//                       timeHintText: "Jam",
//                       type: DateTimePickerType.time,
//                       dateMask: 'HH:ss',

//                       // initialValue: DateTime.now().toString(),
//                       initialTime: TimeOfDay.now(),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       // onChanged: (v) {
//                       //   context.read<UserNecessityBloc>().add(
//                       //         UserNecessityEvent.updateSalary(double.parse(
//                       //             v.replaceAll(RegExp(r"[Rp.]"), ""))),
//                       //       );
//                       // },
//                       keyboardType: TextInputType.multiline,
//                       textInputAction: TextInputAction.newline,
//                       maxLines: 5,
//                       minLines: 3,
//                       decoration: InputDecoration(
//                         // suffixIcon: IconButton(
//                         //     onPressed: () => context
//                         //         .read<UserNecessityBloc>()
//                         //         .add(UserNecessityEvent.toggleSalaryVisbility()),
//                         //     icon: (state.isSalaryVisible)
//                         //         ? Icon(Icons.visibility)
//                         //         : Icon(Icons.visibility_off)),
//                         labelText: 'Deskripsi',
//                         hintText: '',
//                         hintMaxLines: 5,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     SizedBox(
//                       height: 45,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(Colors.red[400]),
//                         ),
//                         child: Text("Batal"),
//                         onPressed: () {
//                           _showCancelConfirmationDialog(context);
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     SizedBox(
//                       height: 45,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(Colors.blue[400]),
//                         ),
//                         child: Text("Tambah"),
//                         onPressed: () {
//                           // final form = context.read<NecessityDynamicFormBloc>();
//                           // final formState = form.state as FormStateSuccess;
//                           // final formValue = formState.value;
//                           // final additionalNeed = NecessityForm(
//                           //   name: formValue["name"],
//                           //   amount: formValue["amount"],
//                           // );
//                           // context.read<UserNecessityBloc>().add(
//                           //       UserNecessityEvent.add(additionalNeed),
//                           //     );
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Future<dynamic> _showCancelConfirmationDialog(BuildContext context) {
//   return showCupertinoDialog(
//       context: context,
//       builder: (context) => Material(
//             color: Colors.transparent,
//             child: CupertinoAlertDialog(
//               content: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "Apakah Anda yakin ingin membatalkan?",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.red[400]),
//                           ),
//                           child: Text("Batal"),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.blue[400]),
//                           ),
//                           child: Text("Ya"),
//                           onPressed: () {
//                             Navigator.pop(context);
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ));
// }
