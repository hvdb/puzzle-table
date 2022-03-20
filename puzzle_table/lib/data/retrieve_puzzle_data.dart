import 'dart:async';

import 'package:puzzle_table/model/puzzle_data.dart';

class PuzzleDataApi {
  static Future getPuzzleData() {
    List<PuzzleData> puzzleData = [];

    var tomatoDescription =
        PuzzleDataDescription(description: 'Some information', language: 'NL');

    var tomato = PuzzleData(
        articleNumber: '20043',
        name: 'Tomato',
        type: 'JVH',
        ean: 8710126200438,
        pieces: 1000,
        year: 2021,
        puzzleDescription: [tomatoDescription]);

    var completer = new Completer<List<PuzzleData>>();

    // At some time you need to complete the future:
    completer.complete([
      tomato,
      tomato,
      tomato,
      tomato,
      tomato,
      tomato,
      tomato,
      tomato,
      tomato,
      tomato,
      tomato,
      tomato,
      tomato
    ]);

    return completer.future;
  }
}
