import 'dart:math';

import 'package:flutter/material.dart';


///
/// Main screen for app
/// for visual intent see diagram <Link: >
///
class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final _scaffoldKey = new GlobalKey<MainScreenState>();

  @override
  Widget build(BuildContext context) {
    Random r = Random(42);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           Expanded(
             flex: 4,
             child: ListView(
               children: <Widget>[
                 Container(
                   height: 200,
                   child: Center(
                     child: Text("explore",
                      style: Theme.of(context).textTheme.title,
                     ),
                   ),
                 ),
                 EventList(r),
                 EventList(r),
                 EventList(r),
                 EventList(r),
               ],
             ),
           )
         ],
        ),
      ),
    );
  }
}

class EventList extends StatelessWidget {
  const EventList(this.r);

  final Random r;

  @override
  Widget build(BuildContext context) {
    double _posterSize = 220;
    const double padding = 10;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("category name"),
        Container(
          height: _posterSize + 10.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(padding),
                child: Container(
                  color: Color.fromARGB(255, r.nextInt(255), r.nextInt(255), r.nextInt(255)),
                  width: _posterSize,
                  height: _posterSize,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(padding),
                child: Container(
                  color: Color.fromARGB(255, r.nextInt(255), r.nextInt(255), r.nextInt(255)),
                  width: 190,
                  height: 190,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(padding),
                child: Container(
                  color: Color.fromARGB(255, r.nextInt(255), r.nextInt(255), r.nextInt(255)),
                  width: 190,
                  height: 190,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(padding),
                child: Container(
                  color: Color.fromARGB(255, r.nextInt(255), r.nextInt(255), r.nextInt(255)),
                  width: 190,
                  height: 190,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color.fromARGB(255, r.nextInt(255), r.nextInt(255), r.nextInt(255)),
                  width: 190,
                  height: 190,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}