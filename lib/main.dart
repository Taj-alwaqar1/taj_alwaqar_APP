// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frist_file_taj_alwaqar/firebase_options.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/NewMessage.dart';

import 'package:frist_file_taj_alwaqar/view/Pages/TeacherDetail.dart';

import 'package:frist_file_taj_alwaqar/l10n/l10n.dart';

import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import 'view/Pages/Home_Tec.dart';
import 'view/Pages/chatscreen.dart';
import 'view/Screen/Screen.dart';

import 'view/Shared/search.dart';
import 'view/Shared/tabBarST.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Locales.init(['en', 'fa', 'ar']);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => GetMaterialApp(
        title: 'Flutter Locales',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: Locales.delegates,
        supportedLocales: L10n.all,
        locale: Locale('ar'),
        home:
            FirebaseAuth.instance.currentUser == null ? Login() : userScreen(),
        getPages: [
          GetPage(name: '/', page: () => Login()),
          GetPage(name: '/search', page: () => searchPage()),
          GetPage(name: '/NewMessagePAge', page: () => NewMessagePAge()),
          GetPage(name: '/teacherDetail', page: () => TeacherDetail()),
        ],
      ),
    );
  }
}