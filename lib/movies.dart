import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'mycard.dart';

class Movies extends StatefulWidget {
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  final String url =
      "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=097f22e0aa702d57dfff42acef5b1874";
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
    if (data == null) {
      return Container();
    } else
      return new Container(
        color: Colors.white30,
        child: GridView(
          addAutomaticKeepAlives: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: data
                .map((obj) => new MyCard(
                      url: obj["poster_path"],
                      title: obj["title"],
                      overview: obj["overview"],
                      releaseDate: obj["release_date"],
                    ))
                .toList()),
      );
  }
}
