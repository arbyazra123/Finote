import 'package:auto_route/auto_route.dart';
import 'package:finote/presentation/report/widgets/necessity_day_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../application/user_necessity/user_necessity_bloc.dart';
import '../../shared/injector.dart';
import '../home/widgets/disbursement_chart_section.dart';

class ReportPage extends StatefulWidget with AutoRouteWrapper {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<UserNecessityBloc>()..add(UserNecessityEvent.get()),
      child: this,
    );
  }
}

class _ReportPageState extends State<ReportPage> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<UserNecessityBloc>().add(
            UserNecessityEvent.get(),
          ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Laporan"),
        ),
        body: RefreshIndicator(
          onRefresh: () async => context.read<UserNecessityBloc>().add(
                UserNecessityEvent.get(),
              ),
          child: BlocBuilder<UserNecessityBloc, UserNecessityState>(
            builder: (context, state) {
              return state.process.maybeWhen(orElse: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }, loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }, success: () {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      // CalendarReport(state: state),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Divider(
                      //   thickness: 5,
                      // ),
                      ChartReport(userNecessityState: state),
                    ],
                  ),
                );
              });
            },
          ),
        ),
      ),
    );
  }
}

class CalendarReport extends StatelessWidget {
  const CalendarReport({
    Key? key,
    required this.state,
  }) : super(key: key);

  final UserNecessityState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        onDaySelected: (date, events) {
          showDayOfNecessity(context, date, state);
        },
        calendarFormat: CalendarFormat.month,
      ),
    );
  }

  Future<dynamic> showDayOfNecessity(
      BuildContext context, DateTime date, UserNecessityState state) {
    return showModalBottomSheet(
      context: context,
      builder: (c) => NecessityDayDialog(
        date: date,
        state: state,
      ),
    );
  }
}
