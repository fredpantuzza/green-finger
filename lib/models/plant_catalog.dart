// Copyright 2020 Green Finger team. All rights reserved.

import 'package:flutter/foundation.dart';
import 'package:green_finger/models/plant.dart';

class PlantCatalog extends ChangeNotifier
{
  final List<Plant> plants;

  PlantCatalog({this.plants});

  void add(Plant plant)
  {
    plants.add(plant);
    notifyListeners();
  }

  void remove(Plant plant)
  {
    plants.remove(plant);
    notifyListeners();
  }

  // TODO remove when DB generated
  int getMaxId()
  {
    int maxId = 0;
    for (var plant in plants) {
      if (plant.id > maxId)
        maxId = plant.id;
    }
    return maxId;
  }

}