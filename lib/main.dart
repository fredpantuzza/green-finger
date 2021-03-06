// Copyright 2020 Green Finger team. All rights reserved.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:green_finger/views/home_screen.dart';
import 'package:green_finger/models/plant.dart';
import 'package:green_finger/models/plant_catalog.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
        PlantCatalog(plants: [
          new Plant(1, 'Test', null),
          new Plant(2, 'Other test', null),
        ]),
      child: MaterialApp(
        title: 'Green Finger',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(title: 'Green Finger'),
      ),
    );
  }
}
