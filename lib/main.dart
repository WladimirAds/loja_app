import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_app/src/pages/auth/controller/auth_controller.dart';
import 'package:loja_app/src/peges_routes/app_pages.dart';

void main() {
  Get.put(AuthController()); // Inicializa o controlador de autenticação
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loja App',
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}
