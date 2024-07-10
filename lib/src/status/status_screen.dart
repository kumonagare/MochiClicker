import 'package:flutter/material.dart';
import 'package:mochi_clicker/src/status/status_data.dart';

import '../Transition/transition.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreen();
}

class _StatusScreen extends State<StatusScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: (context.height -
              (context.safePaddingTop + context.safePaddingBottom)) * 0.72,
      color: const Color.fromARGB(255, 38, 70, 83),
      child: StatusData(),
    );
  }
}
