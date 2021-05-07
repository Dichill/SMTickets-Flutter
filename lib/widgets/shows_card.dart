import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShowsCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String imgSrc;
  const ShowsCard({
    Key key,
    this.title,
    this.location,
    this.date,
    this.imgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 43, 42, 58),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 53, 109),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Center(
              child: Text(
                "$location | $date",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(imgSrc),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 25, 24, 38)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.info_outlined,
                      color: Color.fromARGB(255, 255, 53, 109),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "MORE INFO",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 53, 109),
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 25, 24, 38)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.mobile_friendly_sharp,
                      color: Color.fromARGB(255, 255, 53, 109),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "BUY TICKET",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 53, 109),
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
