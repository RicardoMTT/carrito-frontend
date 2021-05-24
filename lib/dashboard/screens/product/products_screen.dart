import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:probardispositivofisico/app_routing/routing.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/body.dart';
import 'package:probardispositivofisico/notifications/screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Text('DashBoard'),
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/notification.svg'),
          onPressed: () {
            // Get.to(NotificationsScreen());
            Get.toNamed(AppRoutes.notifications);
          },
        ),
        IconButton(
          icon: Icon(Icons.change_history_sharp),
          onPressed: () {
            Get.offNamed(AppRoutes.historial);
          },
        )
      ],
    );
  }
}
