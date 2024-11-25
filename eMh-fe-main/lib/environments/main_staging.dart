import 'package:e_medfile/core/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../config/app_config.dart';
import '../main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "lib/config/.env.staging");
  await AppConfig.initialize();

  Dependencies.init();
  runApp(MyApp());
}