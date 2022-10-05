import 'package:flutter/material.dart';

class VistaCreandose extends StatelessWidget {
  const VistaCreandose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}