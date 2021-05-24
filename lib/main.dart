import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:probardispositivofisico/app_routing/routes.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/graphql.dart';
import 'package:probardispositivofisico/splash/screens/splash/screen.dart';
import 'package:probardispositivofisico/splash/screens/splash/screens_bindings.dart';

void main() {
  Get.lazyPut<GraphQLClient>(() => getGraphqlClient());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(Get.find<GraphQLClient>()),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primaryColor: kPrimaryColor,
          accentColor: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SplashScreen(),
        initialBinding: SplashScreenBindings(),
        onGenerateRoute: AppRouting.onGenerateRoute,
      ),
    );
  }
}
