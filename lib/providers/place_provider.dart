
import 'dart:convert';

import 'package:cozy/models/place.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlaceProvider extends ChangeNotifier {
  getRecommendedPlaces() async {
    var result = 
        await http.get(
          Uri.parse(
            'https://bwa-cozy.herokuapp.com/recommended-spaces'
          ),
        );
  // ignore: avoid_print
  print(result.statusCode);
  // ignore: avoid_print
  print(result.body);

  if (result.statusCode == 200) {
    List data = jsonDecode(result.body);
    List <Place> places = data.map((item) => Place.fromJson(item)).toList();
    return places;
  } else {
    return <Place>[];
  }
  }
}