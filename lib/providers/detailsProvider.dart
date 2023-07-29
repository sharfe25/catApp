import 'package:cat_app/models/Cat.dart';
import 'package:flutter/material.dart';

class DetailsProvider with ChangeNotifier {
  Cat? cat;


  Cat? get getCat {
    return cat;
  }

  setCat(Cat cat) {
    this.cat = cat;
    notifyListeners();
  }

}
