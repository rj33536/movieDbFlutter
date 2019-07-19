import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'peopleCard.dart';

class People extends StatefulWidget {
  People({Key key}) : super(key: key);

  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  final String url =
      "https://api.themoviedb.org/3/person/popular?api_key=097f22e0aa702d57dfff42acef5b1874";
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
                .map((obj) => PeopleCard(
                      url: obj["profile_path"],
                      title: obj['name'],
                    ))
                .toList()),
      );
  }
}
