import 'dart:convert';
import 'package:catbreads/environment.dart';
import 'package:catbreads/models/Cat.dart';
import 'package:http/http.dart' as http;

class CatsController {
  Future getAllCats() async {
    var url = Uri.parse("${Environment.apiUrl}breeds");
    final res = await http.get(url,
        headers: {'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39'});
    List<Cat> cats = [];
    if (res.statusCode == 200) {
      final jsonCats = json.decode(res.body);

      for (var cat in jsonCats) {
        Cat temporaryCat = Cat.fromJson(cat);
        cats.add(temporaryCat);
      }
      return {"res": true, "body": cats};
    } else {
      return {
        "res": false,
        "body": "An issue has occurred, please try again later."
      };
    }
  }

  Future getCatImage(String? referenceImageId) async {
    if (referenceImageId != null) {
      var url = Uri.parse('${Environment.apiUrl}images/$referenceImageId');
      final res = await http.get(url);
      if (res.statusCode == 200) {
        final jsonCats = json.decode(res.body);

        return jsonCats["url"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
