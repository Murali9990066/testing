import 'package:e_medfile/core/dependencies.dart';
import 'package:e_medfile/features/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../config/app_config.dart';
import '../main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "lib/config/.env.prod");
  await AppConfig.initialize();

  await LocalStorage.initialize();
  await Dependencies.init();

  runApp(MyApp());
}
