import 'package:auto_route/auto_route.dart';
import 'package:finote/application/auth_bloc/authentication_bloc.dart';
import 'package:finote/application/necessity_dynamic_form/necessity_dynamic_form_bloc.dart';
import 'package:finote/presentation/home/widgets/disbursement_chart_section.dart';
import 'package:finote/presentation/home/widgets/disbursement_summary_section.dart';
import 'package:finote/shared/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/user_necessity/user_necessity_bloc.dart';
import '../../shared/injector.dart';
import '../report/widgets/necessity_day_dialog.dart';
import '../widgets/custom_end_drawer.dart';
import '../widgets/primary_appbar.dart';

class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<NecessityDynamicFormBloc>(),
        ),
      ],
      child: this,
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserNecessityBloc>().add(UserNecessityEvent.get());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawerEnableOpenDragGesture: false,
      endDrawer: CustomEndDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(AddNecessityRoute());
          context.read<UserNecessityBloc>().add(UserNecessityEvent.get());
        },
        child: const Icon(Icons.add),
      ),
      appBar: PrimaryAppBar(
        title: "Finote",
        actions: <Widget>[
          Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.settings),
              onPressed: () async {
                Scaffold.of(context).openEndDrawer();
              },
            );
          }),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async =>
            context.read<UserNecessityBloc>().add(UserNecessityEvent.get()),
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
              return ListView(
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  ChartReport(userNecessityState: state),
                  SizedBox(
                    height: 14,
                  ),
                  Summary(userNecessityState: state),
                  SizedBox(
                    height: 100,
                  ),
                ],
              );
            });
          },
        ),
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
