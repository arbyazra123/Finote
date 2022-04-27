import 'package:auto_route/auto_route.dart';
import 'package:finote/application/user_necessity/user_necessity_bloc.dart';
import 'package:finote/presentation/widgets/primary_appbar.dart';
import 'package:finote/shared/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ManipulateNecessityPage extends StatefulWidget with AutoRouteWrapper {
  const ManipulateNecessityPage({Key? key}) : super(key: key);

  @override
  State<ManipulateNecessityPage> createState() =>
      _ManipulateNecessityPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _ManipulateNecessityPageState extends State<ManipulateNecessityPage> {
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
        appBar: PrimaryAppBar(title: "Ubah Kebutuhan"),
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
                return ListView.separated(
                  itemCount: state.userNecessity.necessity?.length ?? 0,
                  itemBuilder: (c, i) {
                    var data = state.userNecessity.necessity?[i];
                    return ListTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            data?.name ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "(${DateFormat("dd MMM").format(DateTime.parse(data?.datetime ?? DateTime.now().toString()))}) (${data?.disbursementIntervalType ?? ""})",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          if (data?.id == null) return;
                          await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                        "Apakah Anda yakin ingin menghapus item ini?"),
                                    actions: [
                                      ElevatedButton(
                                        child: Text('Yes'),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                          Colors.red,
                                        )),
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                      ),
                                      ElevatedButton(
                                        child: Text('No'),
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                      ),
                                    ],
                                  )).then(
                            (value) {
                              if (value ?? false) {
                                context.read<UserNecessityBloc>().add(
                                    UserNecessityEvent.deleteById(data!.id!));
                              }
                            },
                          );
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red[200],
                        ),
                      ),
                      subtitle: Text(
                          NumberFormat.currency(decimalDigits: 0, symbol: "Rp")
                              .format(data?.amount ?? 0)),
                    );
                  },
                  separatorBuilder: (_, __) => Divider(),
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
