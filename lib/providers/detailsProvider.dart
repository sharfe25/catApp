import 'package:catbreads/models/Cat.dart';
import 'package:flutter/material.dart';

class DetailsProvider with ChangeNotifier {
  Cat? cat;


  Cat? get getCat {
    return cat;
  }

  String? get getCatImage {
    return cat != null && cat?.imageUrl != null ? cat?.imageUrl! : null;
  }

  setCat(Cat cat) {
    this.cat = cat;
    notifyListeners();
  }

}
