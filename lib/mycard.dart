import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard(
      {@required this.url, this.title, this.overview, this.releaseDate});

  final String url;
  String title;
  final String overview;
  final String releaseDate;
  @override
  Widget build(BuildContext context) {
    if(title.length>20)
    title = title.substring(0,18)+"..";
    return Container(
      padding: EdgeInsets.all(5.0),
      height: 200.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(5.0),
        splashColor: Colors.amberAccent,
        onTap: () => showDialog(
            context: context,
            builder: (context) => SimpleDialog(
                  children: <Widget>[
                    Image.network(
                      "https://image.tmdb.org/t/p/w200/" + url,
                      height: 200.0,
                      width: 300.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            overview,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: "Roboto",
                            ),
                          ),
                          Text(
                            releaseDate,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Flexible(
              child: Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.network(
                        "https://image.tmdb.org/t/p/w200/" + url,
                        height: 120.0,
                        width: 200.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                            ),
                            //if(obj["adult"]==true)
                            Icon(
                              Icons.star_border,
                              color: Colors.cyanAccent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
