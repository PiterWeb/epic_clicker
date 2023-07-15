import '/views/store.dart';
import 'package:flutter/material.dart';
import '/views/counter.dart';

final routes = <String, Widget>{
  'Clicker': const Counter(),
  'Store': const Store(),
};

final routesIcons = <String, IconData>{
  'Clicker': Icons.home,
  'Store': Icons.store,
};
