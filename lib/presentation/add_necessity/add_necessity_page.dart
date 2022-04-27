import 'package:auto_route/auto_route.dart';
import 'package:finote/shared/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/necessity_dynamic_form/necessity_dynamic_form_bloc.dart';
import '../../application/user_necessity/user_necessity_bloc.dart';
import '../../domain/necessity/necessity_form_list.dart';
import '../../shared/injector.dart';
import '../home/widgets/add_necessity_and_date.dart';
import '../home/widgets/necessity_fields.dart';
import '../widgets/primary_appbar.dart';

class AddNecessityPage extends StatefulWidget with AutoRouteWrapper {
  const AddNecessityPage({Key? key}) : super(key: key);

  @override
  State<AddNecessityPage> createState() => _AddNecessityPageState();

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

class _AddNecessityPageState extends State<AddNecessityPage> {
  @override
  void initState() {
    super.initState();
    getIt<UserNecessityBloc>().add(UserNecessityEvent.get());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<UserNecessityBloc>().add(UserNecessityEvent.get());
        return true;
      },
      child: Scaffold(
        appBar: PrimaryAppBar(
          title: "Tambah Kebutuhan",
          actions: [
            IconButton(
              onPressed: () => AutoRouter.of(context).push(
                ManipulateNecessityRoute(),
              ),
              icon: Icon(Icons.edit),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            BlocBuilder<NecessityDynamicFormBloc, NecessityDynamicFormState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: double.maxFinite,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  if (state.formList.forms.isEmpty) return;
                  context.read<UserNecessityBloc>().add(
                        UserNecessityEvent.updateForm(
                          formList: state.formList,
                          dateTime: state.currentDate,
                        ),
                      );
                  context.read<UserNecessityBloc>().add(
                        UserNecessityEvent.save(),
                      );
                  context.read<NecessityDynamicFormBloc>().add(
                        NecessityDynamicFormEvent.clear(),
                      );
                },
                child: Center(child: Text("Simpan")),
              ),
            );
          },
        ),
        body: RefreshIndicator(
          onRefresh: () async =>
              context.read<UserNecessityBloc>()..add(UserNecessityEvent.get()),
          child: ListView(
            children: [
              AddNecessityAndDate(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: NecessityFields(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
