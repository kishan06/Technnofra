import 'package:get/get.dart';
import 'package:technofra/Onboarding/LoginScreen.dart';
import 'package:technofra/Onboarding/OnBoardingScreen.dart';
import 'package:technofra/Onboarding/SplashScreen.dart';
import 'package:technofra/routes/route_name.dart';

class AppRoutes {
  static List<GetPage<dynamic>>? appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashScreen(),
        ),
         GetPage(
          name: RouteName.onboardingScreen,
          page: () => const Onboarding(),
        ),
        GetPage(
          name: RouteName.loginScreen,
          page: () => const LoginScreen(),
        ),
      ];
}
