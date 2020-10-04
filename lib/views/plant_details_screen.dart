// Copyright 2020 Green Finger team. All rights reserved.

import 'package:flutter/material.dart';
import 'package:green_finger/models/plant.dart';

class PlantDetailsScreen extends StatelessWidget {
  final Plant plant;

  PlantDetailsScreen({this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Text(
              plant.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48.0,
              ),
            ),
          ],
        ));
  }
}
