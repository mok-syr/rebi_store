import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rebi_store/registration_module/presentation/get_x/auth_controller.dart';
import 'firebase_options.dart';
import 'registration_module/presentation/pages/start_page/start_page.dart';
import 'screens/home/size_config.dart';
import 'tools/locale/locale.dart';
import 'tools/locale/locale_controller.dart';

late GetStorage box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  box = GetStorage();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    MyLocaleController myLocaleController = Get.put(MyLocaleController());

    return GetMaterialApp(
      title: 'Rebi Store',
      defaultTransition: Transition.cupertino,
      textDirection: TextDirection.ltr,
      locale: myLocaleController.initLocale,
      translations: MyLocale(),

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(),
    );
  }
}
