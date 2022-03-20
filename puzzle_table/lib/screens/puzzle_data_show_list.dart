import 'dart:convert';

import 'package:puzzle_table/data/retrieve_puzzle_data.dart';
import 'package:puzzle_table/model/puzzle_data.dart';
import 'package:flutter/material.dart';
import 'package:puzzle_table/screens/puzzle_data_details.dart';

class PuzzleList extends StatefulWidget {
  const PuzzleList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PuzzleListState createState() => _PuzzleListState();
}

class _PuzzleListState extends State<PuzzleList> {
  static List<PuzzleData> puzzleList = [];

  void getPuzzleDatafromApi() async {
    PuzzleDataApi.getPuzzleData().then((response) {
      setState(() {
        puzzleList = response;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPuzzleDatafromApi();
  }

  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text('widget.title'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );

    ListTile makeListTile(PuzzleData puzzleData) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Image.asset(
                'static/puzzles/images/' +
                    puzzleData.type +
                    '/' +
                    puzzleData.articleNumber +
                    '_box.png',
                fit: BoxFit.scaleDown),
          ),
          title: Text(
            puzzleData.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: Text(puzzleData.articleNumber),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(puzzleData.year.toString(),
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PuzzleDetails(title: 'dd', details: puzzleData)));
          },
        );

    Card makeCard(PuzzleData puzzleData) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(puzzleData),
          ),
        );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: puzzleList.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(puzzleList[index]);
        },
      ),
    );
    return Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: topAppBar,
        bottomNavigationBar: makeBottom,
        body: makeBody
        // body: ListView.builder(
        //     itemCount: puzzleList.length,
        //     itemBuilder: (context, index) {
        //       return Card(
        //         clipBehavior: Clip.antiAlias,
        //         child: Container(
        //           height: 180,
        //           padding: const EdgeInsets.all(0),
        //           child: Row(children: [
        //             Expanded(
        //               flex: 6,
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                     image: DecorationImage(
        //                         image: AssetImage('static/puzzles/images/' +
        //                             puzzleList[index].type +
        //                             '/' +
        //                             puzzleList[index].articleNumber +
        //                             '_box.png'),
        //                         fit: BoxFit.scaleDown)),
        //               ),
        //             ),
        //             Spacer(
        //               flex: 1,
        //             ),
        //             Expanded(
        //               flex: 14,
        //               child: Container(
        //                 padding: const EdgeInsets.only(top: 5),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   mainAxisAlignment: MainAxisAlignment.end,
        //                   children: <Widget>[
        //                     Text(puzzleList[index].name,
        //                         style: TextStyle(
        //                             fontSize: 30.0, fontWeight: FontWeight.bold)),
        //                     Row(
        //                       children: <Widget>[
        //                         Text(
        //                           'Number : ',
        //                           style: TextStyle(fontWeight: FontWeight.normal),
        //                         ),
        //                         Text(
        //                           puzzleList[index].articleNumber,
        //                           style: TextStyle(),
        //                         ),
        //                       ],
        //                     ),
        //                     Row(
        //                       children: <Widget>[
        //                         Text(
        //                           'Introduction year : ',
        //                           style: TextStyle(fontWeight: FontWeight.normal),
        //                         ),
        //                         Text(
        //                           puzzleList[index].year.toString(),
        //                           style: TextStyle(),
        //                         )
        //                       ],
        //                     ),
        //                     Align(
        //                       alignment: Alignment.bottomRight,
        //                       child: Row(
        //                         mainAxisAlignment: MainAxisAlignment.end,
        //                         children: <Widget>[
        //                           TextButton(
        //                               onPressed: () {
        //                                 Navigator.push(
        //                                   context,
        //                                   MaterialPageRoute(
        //                                       builder: (context) => PuzzleDetails(
        //                                           title:
        //                                               'Details for: ${puzzleList[index].name}',
        //                                           details: puzzleList[index])),
        //                                 );
        //                               },
        //                               child: Text('Details')),
        //                           TextButton(
        //                               onPressed: null,
        //                               child: Text('Where to order')),
        //                         ],
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ]),
        //         ),
        //       );
        //     }),
        );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text('Puzzle overview'),
  //       ),
  //       body: Container(
  //         child: ListView.builder(
  //             itemCount: puzzleList.length,
  //             itemBuilder: (context, index) {
  //               return ListTile(
  //                   title: Text(puzzleList[index].name),
  //                   leading: SizedBox(
  //                       height: 200.0,
  //                       width: 200.0, // fixed width and height
  //                       child: Image(
  //                           image: AssetImage('static/puzzles/images/' +
  //                               puzzleList[index].type +
  //                               '/' +
  //                               puzzleList[index].articleNumber +
  //                               '_box.png'))));
  //             }),
  //       ));
  // }
}
