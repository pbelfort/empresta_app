import 'package:empresta/app/routes/app_pages.dart';
import 'package:empresta/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/modules/splash/splash_binding.dart';
import 'app/modules/splash/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH, //Rota inicial
      initialBinding: SplashBinding(), // dependencias iniciais
      home: const SplashPage(), // Page inicial
      theme: appThemeData, //Tema personalizado app
      defaultTransition: Transition.leftToRight, // Transição de telas padrão
      getPages: AppPages.routes, // Seu array de navegação contendo as rotas
      locale: const Locale('pt', 'BR'), // Língua padrão
      // translationsKeys:
      //     AppTranslation.translations, // Suas chaves contendo as traduções<map>
    );
  }
}
