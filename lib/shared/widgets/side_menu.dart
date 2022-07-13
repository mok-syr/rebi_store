import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebi_store/registration_module/presentation/get_x/auth_controller.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);

  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              style: ListTileStyle.drawer,
              onTap: () {
                authController.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
