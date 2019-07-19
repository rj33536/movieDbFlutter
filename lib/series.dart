import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'mycard.dart';

class Series extends StatefulWidget {
  Series({Key key}) : super(key: key);

  _SeriesState createState() => _SeriesState();
}

class _SeriesState extends State<Series> {
  final String url =
      "https://api.themoviedb.org/3/tv/popular?api_key=097f22e0aa702d57dfff42acef5b1874";
  List data;

  Future<String> getdata() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    //print(response.body);
    setState(() {
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      data = jsondata["results"] as List;
    });
    return "success";
  }

  @override
  void initState() {
    super.initState();
    this.getdata();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null)
      return Center(child: Text("Loading"));
    else
      return new Container(
        color: Colors.white30,
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: data
                .map((obj) => MyCard(
                      url: obj["poster_path"],
                      title: obj["name"],
                      overview: obj["overview"],
                      releaseDate: obj['first_air_date'],
                    ))
                .toList()),
      );
  }
}
