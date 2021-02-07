import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_kos/models/recommended.dart';
import 'package:http/http.dart' as http;

class RecommendedProvider extends ChangeNotifier {
  getRecommended() async {
    var result =
        await http.get('http://bwa-cozy.herokuapp.com/recommended-spaces');
    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Recommended> recommended =
          data.map((item) => Recommended.fromJson(item)).toList();
      return recommended;
    } else {
      return <Recommended>[];
    }
  }
}
