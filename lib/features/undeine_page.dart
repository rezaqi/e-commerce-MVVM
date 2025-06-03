import 'package:flutter/material.dart';

class UndefinePage extends StatelessWidget {
  const UndefinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrong Route"),
      ),
      body: Center(
        child: Text("Undefine Page"),
      ),
    );
  }
}
