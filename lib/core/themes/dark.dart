part of 'app_theme.dart';

ThemeData get _dark {
  return ThemeData(
    // brightness: Brightness.dark,
    primarySwatch: ColorHelper.primaryGreen.toMaterialColor(),
    primaryColor: ColorHelper.primaryGreen,
    useMaterial3: true,
    canvasColor: ColorHelper.backgroundBlack,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorHelper.backgroundBlack,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: ColorHelper.backgroundBlack,
      ),
    ),
    scaffoldBackgroundColor: ColorHelper.backgroundBlack, // scaffold background
  );
}
