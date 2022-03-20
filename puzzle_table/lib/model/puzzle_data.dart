import 'package:flutter/material.dart';

class PuzzleData {
  String id = UniqueKey().toString();
  String articleNumber;
  String name;
  String type;
  int ean;
  int pieces;
  int year;
  List<PuzzleDataDescription> puzzleDescription;

  PuzzleData(
      {required this.articleNumber,
      required this.name,
      required this.type,
      required this.ean,
      required this.pieces,
      required this.year,
      required this.puzzleDescription});

  // Character.fromJson(Map json)
  //     : id = json['id'],
  //       name = json['name'],
  //       img = json['img'],
  //       nickname = json['nickname'];

  // Map toJson() {
  //   return {'id': id, 'name': name, 'img': img, 'nickname': nickname};
  // }
}

class PuzzleDataDescription {
  String description;
  String language;

  PuzzleDataDescription({required this.description, required this.language});
}
