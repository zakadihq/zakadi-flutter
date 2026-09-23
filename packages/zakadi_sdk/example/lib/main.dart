import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

/// The zakadi_sdk example app, host of the plugin's integration tests
/// (spec 08 8.8). The demo-backend and fake-edge modes arrive with the session
/// API.
class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('zakadi_sdk example')),
        body: const Center(child: Text('No session API yet.')),
      ),
    );
  }
}
