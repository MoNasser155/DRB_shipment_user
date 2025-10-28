import 'dart:developer';
import 'package:drb_shipment_user/core/constants.dart';
import 'package:drb_shipment_user/core/utils/cashe_storage.dart';
import 'package:drb_shipment_user/core/utils/shared_pref_sengelton.dart';
import 'package:drb_shipment_user/features/main_view/presentation/screens/main_view_screen.dart';
import 'package:drb_shipment_user/features/onboarding/presentation/cubits/cubit/onboarding_cubit.dart';
import 'package:drb_shipment_user/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../../../core/utils/navigator_helper.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/presentation/screens/login_screen.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  static SplashCubit get(context) => BlocProvider.of(context);

  removeNaitveSplash() {
    Future.delayed(
      Duration(milliseconds: 200),
    ).then((val) => FlutterNativeSplash.remove());
    emit(RemoveSplashState());
    startApp();
    emit(StartAppState());
  }

  bool isViewingOnboarding() {
    final isViewed = Prefs.getBool(Constants.kIsOnboardingViewed);
    log(isViewed.toString());
    return isViewed;
  }

  startApp() {
    Future.delayed(Duration(seconds: 2)).then((val) {
      _handleNavigation();
    });
    emit(StartAppState());
  }

  void _handleNavigation() {
    final userMap = CacheStorage.read(Constants.userKey, isDecoded: true);
    if (!isViewingOnboarding()) {
      AppNavigator.pushReplacement(
        transitionBuilder: AppNavigator.cupertinoTransition,
        screen: BlocProvider(
          create: (context) => OnboardingCubit(),
          child: OnboardingScreen(),
        ),
      );
    } else {
      log(userMap.toString());
      if (userMap == null) {
        AppNavigator.pushReplacement(
          transitionBuilder: AppNavigator.cupertinoTransition,
          screen: LoginScreen(),
        );
      } else {
        final user = UserEntity.fromMap(userMap);
        AppNavigator.pushReplacement(
          transitionBuilder: AppNavigator.cupertinoTransition,
          screen: MainViewScreen(user: user),
        );
      }
    }
  }
}
