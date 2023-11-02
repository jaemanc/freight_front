import 'package:flutter/material.dart';


const String _MainIconPath = 'assets/main_icons';
const String _ImagesPath = 'assets/images';
const String _MenuIconPath = 'assets/main_icons';

class _MainIcon extends AssetImage {
  const _MainIcon(String fileName) : super('$_MainIconPath/$fileName');
}

class _Images extends AssetImage {
  const _Images(String fileName) : super('$_ImagesPath/$fileName');
}

class _MenuIcon extends AssetImage {
  const _MenuIcon(String fileName) : super('$_MenuIconPath/$fileName');
}

class AppImages {
  static const mainTruck = _MainIcon('main_truck.png');
  static const menuDocument = _MenuIcon('menu_documents.png');
  static const menuRefuel = _MenuIcon('menu_refuel.png');
  static const menuSpend = _MenuIcon('menu_spend.png');
  static const menuFix = _MenuIcon('menu_fix.png');
}