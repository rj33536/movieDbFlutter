import 'package:flutter/material.dart';
import 'movies.dart';
import 'people.dart';
import 'series.dart';

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Popularity', icon: Icons.directions_boat),
  const Choice(title: 'Recent', icon: Icons.directions_bus),
  const Choice(title: 'Language', icon: Icons.directions_railway),
];

void main() => runApp(new MaterialApp(
      home: new TabBarDemo(),
    ));

class TabBarDemo extends StatelessWidget {
  void _select(Choice s) {
    print(s);
    print("success");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default Brightness and Colors
        brightness: Brightness.light,
        primaryColor: Colors.purple,
        accentColor: Colors.white,
        // Define the default Font Family
        fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.search,
                  size: 28.0,
                ),
              ),
              PopupMenuButton<Choice>(
                onSelected: _select,
                itemBuilder: (BuildContext context) {
                  return choices.skip(2).map((Choice choice) {
                    return PopupMenuItem<Choice>(
                      value: choice,
                      child: Text(choice.title),
                    );
                  }).toList();
                },
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: "MOVIES"),
                Tab(text: "SERIES"),
                Tab(text: "SAVED"),
                Tab(text: "PEOPLE"),
              ],
            ),
            title: Text('Movie DB'),
          ),
          body: TabBarView(
            children: [
              new Movies(),
              new Series(),
              new Movies(),
              new People(),
            ],
          ),
        ),
      ),
    );
  }
}
