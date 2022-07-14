import 'package:flutter/material.dart';

import '../../shared/components/components/coustom_bottom_nav_bar.dart';
import 'components/body.dart';
import 'enums.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

}
