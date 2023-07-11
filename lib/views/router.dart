import 'package:flutter/material.dart';
import 'package:epic_clicker/layout/main_layout.dart';
import 'package:epic_clicker/views/counter.dart';

final routes = <String, WidgetBuilder>{
  '/counter': (context) => const MainLayout(child: Counter()),
};
