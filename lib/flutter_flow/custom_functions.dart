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

dynamic transformToJSON(List<String>? categoriesSelected) {
  if (categoriesSelected == null) return jsonDecode("{}");

  if (categoriesSelected.isEmpty) return jsonDecode("{}");
  Iterable<String> quoted = categoriesSelected.map((e) => "\"" + e + "\"");

  String middle = quoted.join(",");

  return jsonDecode("{\"categoryId\":{\"in\" : [$middle]}}");
}

List<String> checkNullabilty(List<String>? list) {
  if (list == null) return [];
  return list;
}

String getImages(List<dynamic> images) {
  if (images.isEmpty)
    return "https://images.unsplash.com/photo-1561758033-d89a9ad46330?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxjb21pZGF8ZW58MHx8fHwxNjkyMTQyMjQ4fDA&ixlib=rb-4.0.3&q=80&w=1080";

  return images.first;
}
