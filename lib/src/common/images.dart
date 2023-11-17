// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const String _MainIconPath = 'assets/main_icons';
const String _ImagesPath = 'assets/images';
const String _MenuIconPath = 'assets/main_icons';
const String _AppBarIconPath = 'assets/appbar_icons';

class _MainIcon extends AssetImage {
  const _MainIcon(String fileName) : super('$_MainIconPath/$fileName');
}

class _Images extends AssetImage {
  const _Images(String fileName) : super('$_ImagesPath/$fileName');
}

class _MenuIcon extends AssetImage {
  const _MenuIcon(String fileName) : super('$_MenuIconPath/$fileName');
}

class _AppBarIcon extends AssetImage {
  const _AppBarIcon(String fileName) : super('$_AppBarIconPath/$fileName');
}

class AppImages {
  static const mainTruck = _MainIcon('main_truck.png');
  static const menuDocument = _MenuIcon('menu_document.png');
  static const menuRefuel = _MenuIcon('menu_refuel.png');
  static const menuSpend = _MenuIcon('menu_spend.png');
  static const menuFix = _MenuIcon('menu_maintenance.png');
  static const exit2 = _AppBarIcon('appbar_exit2.png');
  static const setting = _AppBarIcon('appbar_setting.png');

}
