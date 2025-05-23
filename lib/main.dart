import 'package:flutter/material.dart';
import 'package:github_repo/app/app.dart';
import 'package:github_repo/common/common_setup.dart';

Future<void> main() async {
  await commonSetup();
  runApp(const MyApp());
}


