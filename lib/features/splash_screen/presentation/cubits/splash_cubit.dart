import 'package:drb_shipment_user/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../../../core/utils/navigator_helper.dart';

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

  startApp() {
    Future.delayed(Duration(seconds: 2)).then(
      (val) => AppNavigator.pushReplacement(
        transitionBuilder: AppNavigator.cupertinoTransition,
        screen: OnboardingScreen(),
      ),
    );
    emit(StartAppState());
  }
}
