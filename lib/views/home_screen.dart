// Copyright 2020 Green Finger team. All rights reserved.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:green_finger/views/edit_plant_screen.dart';
import 'package:green_finger/models/plant_catalog.dart';
import 'package:green_finger/views/plant_catalog_screen.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Consumer<PlantCatalog>(
              builder: (context, plantCatalog, child) => PlantCatalogScreen(plantCatalog: plantCatalog)
          )
      ),
      floatingActionButton: _AddPlantButton(),
    );
  }
}

class _AddPlantButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                EditPlantScreen(type: EditPlantScreenType.Creation)));
      },
      tooltip: 'Add plant',
      child: Icon(Icons.add),
    );
  }

}