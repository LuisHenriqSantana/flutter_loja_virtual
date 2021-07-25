import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer.dart';
import 'package:loja_virtual/models/page_manager.dart';
import 'package:loja_virtual/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        children: <Widget>[
          LoginScreen(),
          Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(title: const Text('Home'),),
          ),
          Container(color: Colors.red,),
          Container(color: Colors.green,),
          Container(color: Colors.yellow,),
        ],
      ),
    );
  }
}
