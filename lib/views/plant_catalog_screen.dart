// Copyright 2020 Green Finger team. All rights reserved.

import 'package:flutter/widgets.dart';
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
          return PlantCatalogItem(plant: plantCatalog.plants[index]);
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
    return Container(
      key: ValueKey(plant.id),
      padding: EdgeInsets.all(10.0),
      child: new Text(plant.name),
    );
  }

}