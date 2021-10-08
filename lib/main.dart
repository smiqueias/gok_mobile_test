import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/app_module.dart';
import 'package:gok_mobile_test/src/app/app_widget.dart';

void main() {
  runApp( ModularApp(module: AppModule(), child: const AppWidget()));
}

