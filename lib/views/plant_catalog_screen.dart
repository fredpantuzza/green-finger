// Copyright 2020 Green Finger team. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:green_finger/views/plant_details_screen.dart';
import 'package:green_finger/models/plant.dart';
import 'package:green_finger/models/plant_catalog.dart';

class PlantCatalogScreen extends StatelessWidget
{
  final PlantCatalog plantCatalog;

  PlantCatalogScreen({this.plantCatalog});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(plantCatalog.plants.length, (index) {
          return Padding(
              padding: EdgeInsets.all(25.0),
              child: PlantCatalogItem(plant: plantCatalog.plants[index]),
          );
        }),
    );
  }
}

class PlantCatalogItem extends StatelessWidget
{
  final Plant plant;

  PlantCatalogItem({this.plant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                PlantDetailsScreen(plant: this.plant)));
      },
      child: Container(
        key: ValueKey(plant.id),
        padding: EdgeInsets.all(15.0),
        child: new Text(plant.name),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }

}