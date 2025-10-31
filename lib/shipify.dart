import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/themes/app_theme.dart';
import 'core/utils/navigator_helper.dart';
import 'features/splash_screen/presentation/cubits/splash_cubit.dart';
import 'features/splash_screen/presentation/screens/splash_screen.dart';

class ShipifyApp extends StatelessWidget {
  const ShipifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Shipify',
            navigatorKey: AppNavigator.navigatorKey,
            theme: AppTheme.dark,
            home: BlocProvider(
              create: (context) => SplashCubit()..removeNaitveSplash(),
              child: SplashScreen(),
            ),
          ),
    );
  }
}
