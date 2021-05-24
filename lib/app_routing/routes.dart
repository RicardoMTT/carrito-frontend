import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probardispositivofisico/app_routing/routing.dart';
import 'package:probardispositivofisico/authentication/screens/login/screen.dart';
import 'package:probardispositivofisico/dashboard/product_binding.dart';
import 'package:probardispositivofisico/dashboard/screens/details/details_screen.dart';
import 'package:probardispositivofisico/dashboard/screens/product/products_screen.dart';
import 'package:probardispositivofisico/history/screen.dart';
import 'package:probardispositivofisico/notifications/screen.dart';
import 'package:probardispositivofisico/splash/screens/splash/screen.dart';
import 'package:probardispositivofisico/splash/screens/splash/screens_bindings.dart';

class AppRouting {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return GetPageRoute(
          settings: settings,
          transition: Transition.fadeIn,
          page: () => LoginScreen(),
        );

      case AppRoutes.home:
        return GetPageRoute(
          settings: settings,
          transition: Transition.fadeIn,
          binding: ProductsBinding(),
          page: () => ProductsScreen(),
        );

      case AppRoutes.productDetails:
        return GetPageRoute(
          settings: settings,
          transitionDuration: Duration(milliseconds: 1000),
          transition: Transition.rightToLeftWithFade,
          page: () => DetailsScreen(),
        );

      case AppRoutes.historial:
        return GetPageRoute(
          settings: settings,
          page: () => HistoryScreen(),
        );

      // case AppRoutes.signup:
      //   return GetPageRoute(settings: settings, page: () => SignUpScreen());

      // case AppRoutes.tabs:
      //   return GetPageRoute(settings: settings, page: () => TabsScreen());

      //Notificaciones
      case AppRoutes.notifications:
        return GetPageRoute(
          settings: settings,
          page: () => NotificationsScreen(),
        );

      default:
        return GetPageRoute(
            settings: settings,
            page: () => SplashScreen(),
            binding: SplashScreenBindings());
    }
  }
}
