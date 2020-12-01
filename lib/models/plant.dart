// Copyright 2020 Green Finger team. All rights reserved.

import 'package:flutter/foundation.dart';

class Plant extends ChangeNotifier
{
  final int _id;
  String _name;
  String _mainPicturePath;

  Plant(this._id, this._name, this._mainPicturePath);

  int get id => _id;

  String get name => _name;

  set name(String name)
  {
    _name = name;
    notifyListeners();
  }

  String get mainPicturePath => _mainPicturePath;

  set mainPicturePath(String mainPicturePath)
  {
    _mainPicturePath = mainPicturePath;
    notifyListeners();
  }

  @override
  bool operator ==(Object other) => other is Plant && _id == other._id;

  @override
  int get hashCode => _id.hashCode;

}