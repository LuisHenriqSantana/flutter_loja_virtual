import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer_header.dart';
import 'package:loja_virtual/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          CustomDrawerHeader(),
          DrawerTile(
            iconData: Icons.home,
            title: 'Início',
            page: 0,
          ),
          DrawerTile(
            iconData: Icons.list,
            title: 'Produtos',
            page: 1,
          ),
          DrawerTile(
            iconData: Icons.playlist_add_check,
            title: 'Meus Pedidios',
            page: 2,
          ),
          DrawerTile(
            iconData: Icons.store,
            title: 'Lojas',
            page: 3,
          ),
        ],
      ),
    );
  }
}