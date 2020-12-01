// Copyright 2020 Green Finger team. All rights reserved.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:green_finger/models/plant.dart';
import 'package:green_finger/models/plant_catalog.dart';

enum EditPlantScreenType {
  Creation,
  Edition
}

class EditPlantScreen extends StatefulWidget {
  final EditPlantScreenType type;
  final String title;

  EditPlantScreen({this.type})
    : title = _getTitle(type);

  static String _getTitle(EditPlantScreenType type)
  {
    switch (type)
    {
      case EditPlantScreenType.Creation:
        return 'New plant';
      case EditPlantScreenType.Edition:
        return 'Edit plant';
    }
    throw Exception('Unexpected type');
  }

  @override
  _EditPlantScreenState createState() => _EditPlantScreenState();
}

class _EditPlantScreenState extends State<EditPlantScreen> {

  final _formKey = GlobalKey<FormState>();

  File _mainImage;
  final _imagePicker = ImagePicker();

  final _nameTextEditorController = TextEditingController();

  Future _pickMainImage() async {
    final pickedImage = await _imagePicker.getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      // copy the image to the local storage
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      final fileName = path.basename(pickedImage.path);
      final savedImage = await File(pickedImage.path).copy('${appDir.path}/$fileName');

      setState(() {
        _mainImage = savedImage;
      });
    }
  }

  void _submit() {
    // TODO logging
    if (!_formKey.currentState.validate())
      return;

    var buildContext = _formKey.currentContext;

    var plantCatalog = buildContext.read<PlantCatalog>();
    switch (widget.type)
    {
      case EditPlantScreenType.Creation:
        _submitNewPlant(plantCatalog);
        break;
      case EditPlantScreenType.Edition:
        // TODO
        throw Exception('Not implemented yet');
    }

    Navigator.pop(buildContext);
  }

  void _submitNewPlant(PlantCatalog plantCatalog) {
    int newId = plantCatalog.getMaxId() + 1;
    var name = _nameTextEditorController.text;
    var newPlant = Plant(newId, name, _mainImage?.path);

    plantCatalog.add(newPlant);
  }

  bool _hasModifiedData() {
    var name = _nameTextEditorController.text;
    // TODO edition
    return name.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_hasModifiedData()) {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Discard changes?'),
                  content: Text('Are you sure you want to discard the changes you''ve made?'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Discard'),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    FlatButton(
                      child: Text('Continue editing'),
                      onPressed: () {
                        Navigator.pop(context, false);
                      }
                    ),
                  ],
                );
              }
          );
        }
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Consumer<PlantCatalog>(
          builder: (context, plantCatalog, child) => Center(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                children: <Widget>[
                  GestureDetector(
                    onTap: _pickMainImage,
                    child: _mainImage == null
                        ? Text('Tap to add image.')
                        : Image.file(_mainImage),
                  ),
                  TextFormField(
                    controller: _nameTextEditorController,
                    decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Name of your plant (shown in the main page)'
                    ),
                    validator: (String value) {
                      return value.trim().isEmpty ? 'Mandatory field' : null;
                    },
                  ),
                  RaisedButton(
                    onPressed: _submit,
                    child: Text('Add'),
                  ),
                ],
              ),
            )
          )
        )
      )
    );
  }

  @override
  void dispose() {
    _nameTextEditorController.dispose();
    super.dispose();
  }

}