import 'package:calorias_diaria/core/app/binding/app_binding.dart';
import 'package:calorias_diaria/core/routes/app_pages.dart';
import 'package:calorias_diaria/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Calorias Diárias',
      theme: AppTheme.theme,
      initialBinding: AppBinding(),
      getPages: AppPages.pages,
    );
  }
}
