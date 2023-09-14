import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

dynamic transformToJSON(
  List<String>? categoriesSelected,
  String? text,
) {
  String contains = text == "" ? "" : "\"name\":{\"contains\": \"$text\"}";
  String cat = "";
  if (categoriesSelected != null && !categoriesSelected.isEmpty) {
    Iterable<String> quoted = categoriesSelected.map((e) => "\"" + e + "\"");

    String middle = quoted.join(",");
    cat = "\"categoryId\":{\"in\" : [$middle]}";
  }
  String coma = "";
  if (contains != "" && cat != "") coma = ",";
  String data = "$contains $coma $cat";

  return jsonDecode("{$data}");
}

List<String> checkNullabilty(List<String>? list) {
  if (list == null) return [];
  return list;
}

String getImages(List<dynamic> images) {
  if (images.isEmpty)
    return "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/entregas-test-3mrrb8/assets/5ssjupsu26sv/descarga.png";

  return images.first;
}

List<String> addOrRemoveCat(
  List<String> list,
  String item,
) {
  if (list.contains(item)) {
    list.remove(item);
  } else {
    list.add(item);
  }
  return list;
}

String filterJsonList(
  List<dynamic> list,
  String? name,
) {
  return list.where((x) => (x["name"] == name)).first["_id"]["_id"];
}

bool newCustomFunction(
  List<dynamic> list,
  String id,
  String name,
) {
  return list.where((x) => (x["name"] == name)).first["provinceId"]["_id"] ==
      id;
}
