import 'package:architecture_template/environment.dart';
import 'package:architecture_template/features/main_app/main_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MainApp(
      environment: EnvironmentProduction(),
    ),
  );
}
