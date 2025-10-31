import 'package:drb_shipment_user/core/utils/bloc_observer.dart';
import 'package:drb_shipment_user/core/utils/shared_pref_sengelton.dart';
import 'package:drb_shipment_user/shipify.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/languages/languages.dart';
import 'core/shared/di.dart';
import 'core/utils/cashe_storage.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  setupAppDebendencies();
  await Future.wait([
    Firebase.initializeApp(),
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
    Prefs.init(),
    CacheStorage.init(),
  ]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    EasyLocalization(
      supportedLocales: Languages.supportedLocales,
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('en'),
      child: const ShipifyApp(),
    ),
  );
}
