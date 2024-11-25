import 'package:e_medfile/core/app_routes.dart';
import 'package:e_medfile/core/routes.enum.dart';
import 'package:e_medfile/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:e_medfile/config/app_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  // AppConfig is already initialized in the environment-specific main files
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 663),
      minTextAdapt: false,
      child: GestureDetector(
        onTap: () {
          // Dismiss keyboard and remove focus when tapping outside of text fields
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: GetMaterialApp(
          getPages: AppRoutes.routes,
          debugShowCheckedModeBanner: AppConfig.debugMode,
          title: AppConfig.appName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: Routes.root.route,
        
          // TODO: Add localization
          //   localizationsDelegates: [
          //   const AppLocalizationsDelegate(),
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          // supportedLocales: AppLocalizations.supportedLocales(),
        ),
      ),
    );
  }
}
