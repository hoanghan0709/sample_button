import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_plugin_flutter/sample_plugin_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Phần 2. Hướng dẫn tạo Widget với plugin
              SampleButton(
                text: "Sample Button",
                onPressed: () {
                  setState(() {});
                  print("Sample Button Click");
                },
              ),
              FutureBuilder<String?>(
                future: SampleCallNativeFlutter.platformVersion,
                builder: (_, snapshoot) {
                  return Text(snapshoot.data ?? '');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  aa() {
    Future.sync(() {
      print('Sync Future');
    });
  }
}
