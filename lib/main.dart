import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/counter_model.dart';
import 'model/store_model.dart';
import 'views/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterModel()),
        ChangeNotifierProvider(create: (context) => StoreModel()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: routes.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Epic Clicker"),
            bottom: TabBar(
              tabs: routes.keys
                  .map((route) => Tab(
                        text: route,
                        icon: Icon(routesIcons[route]!),
                      ))
                  .toList(),
            ),
          ),
          body: TabBarView(
            children: routes.values.toList(),
          ),
        ),
      ),
    );
  }
}
