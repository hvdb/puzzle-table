// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:puzzle_table/model/puzzle_data.dart';
import 'package:puzzle_table/screens/puzzle_data_show_list.dart';

void main() {
  runApp(const PuzzleTable());
}

class PuzzleTable extends StatelessWidget {
  const PuzzleTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to puzzle table',
        theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
        home: PuzzleList(title: 'Puzzle table'));
  }
}
