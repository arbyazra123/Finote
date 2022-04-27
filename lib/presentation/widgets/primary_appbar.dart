
import 'package:flutter/material.dart';

import '../../shared/theme/app_color.dart';

class PrimaryAppBar extends StatelessWidget with PreferredSizeWidget {
  PrimaryAppBar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
      backgroundColor: AppColor.primary,
      elevation: 1,
    );
  }

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);
}
