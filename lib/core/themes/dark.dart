part of 'app_theme.dart';

ThemeData get _dark {
  return ThemeData(
    primarySwatch: ColorHelper.primaryGreen.toMaterialColor(),
    primaryColor: ColorHelper.primaryGreen,
    useMaterial3: true,
    canvasColor: ColorHelper.grey100,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      toolbarHeight: 0,
      backgroundColor: ColorHelper.backgroundBlack,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: ColorHelper.backgroundBlack,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: ColorHelper.grey100,
      ),
    ),
    scaffoldBackgroundColor: ColorHelper.backgroundBlack,
  );
}
