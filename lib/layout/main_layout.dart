import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Epic Clicker"),
        backgroundColor: Colors.amberAccent,
        actions: const [
          FloatingActionButton(
            onPressed: null,
            backgroundColor: Colors.amber,
            child: Text("0"),
          )
        ],
      ),
      body: Material(
        child: child,
      ),
    );
  }
}
