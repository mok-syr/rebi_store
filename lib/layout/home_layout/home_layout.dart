import 'package:flutter/material.dart';
import 'package:rebi_store/shared/widgets/side_menu.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Home Page'),
      ),
      drawer: SideMenu(),
    );
  }
}
