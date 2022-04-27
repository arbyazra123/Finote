import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth_bloc/authentication_bloc.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Atur Waktu Notifikasi'),
            onTap: () async {
              await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((value) async {
                if (value == null) return;
                await AwesomeNotifications().createNotification(
                  schedule: NotificationCalendar(
                      hour: value.hour,
                      minute: value.minute,
                      repeats: true,
                      preciseAlarm: true),
                  content: NotificationContent(
                    id: 11,
                    channelKey: NOTIFICATION_CHANNEL_NAME,
                    title: "Finote",
                    body: "Apakah kamu ada pengeluaran hari ini?",
                  ),
                );
              });
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () async {
              await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("Apakah Anda yakin ingin keluar?"),
                        actions: [
                          ElevatedButton(
                            child: Text('Yes'),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
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
                    context
                        .read<AuthenticationBloc>()
                        .add(const AuthenticationEvent.logoutRequested());
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
