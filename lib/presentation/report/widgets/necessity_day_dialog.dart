import 'package:finote/shared/utility/main_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../application/user_necessity/user_necessity_bloc.dart';
import '../../../shared/injector.dart';

class NecessityDayDialog extends StatelessWidget {
  const NecessityDayDialog({
    Key? key,
    required this.date,
    required this.state,
  }) : super(key: key);
  final DateTime date;
  final UserNecessityState state;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserNecessityBloc>()
        ..add(UserNecessityEvent.getByDate(
            dateTime: date, userNecessity: state.userNecessity)),
      child: BlocBuilder<UserNecessityBloc, UserNecessityState>(
        builder: (context, state) {
          return state.process.maybeWhen(
            orElse: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            success: () {
              return Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "Pengeluaranmu pada ${DateFormat('EEEE, dd MMM yyyy').format(date)}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.close),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.only(bottom: 100),
                          itemBuilder: (context, index) {
                            var currentData =
                                state.userNecessity.necessity?[index];
                            return ListTile(
                              title: Text(currentData?.name ?? ""),
                              trailing: Text(NumberFormat.currency(
                                      decimalDigits: 0, symbol: "Rp")
                                  .format(currentData?.amount ?? 0)),
                              subtitle: Text(
                                  "${(currentData?.disbursementIntervalType ?? "")} "),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              Divider(height: 0),
                          itemCount: state.userNecessity.necessity?.length ?? 0,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.maxFinite,
                      height: 45,
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 2,
                                color: Colors.black.withOpacity(0.09))
                          ],
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Total",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Text(
                            NumberFormat.currency(
                                    decimalDigits: 0, symbol: "Rp")
                                .format(state.userNecessity.necessity?.fold(
                                        0.0,
                                        (double? previousValue, element) =>
                                            (previousValue ?? 0) +
                                            (element.amount ?? 0)) ??
                                    0),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
          // return Column(
          //   children: [],
          // );
        },
      ),
    );
  }
}
