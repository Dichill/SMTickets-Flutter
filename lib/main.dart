import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smtickets_training/api/models/attractionsmodel.dart';
import 'package:smtickets_training/api/models/eventsmodel.dart';
import 'package:smtickets_training/api/models/venuesmodel.dart';

// Widgets
import 'widgets/shows_card.dart';

// API
import 'api/smtickets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SM Tickets",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: Color.fromARGB(255, 25, 24, 38),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<VenuesModel> _venuesModel;
  Future<EventsModel> _eventsModel;
  Future<AttractionsModel> _attractionsModel;

  @override
  void initState() {
    _venuesModel = SMTicketsAPI().getVenues();
    _eventsModel = SMTicketsAPI().getEvents();
    _attractionsModel = SMTicketsAPI().getAttractions();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    bool _isSearching = false;
    var _movies = "SM TICKETS";

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 25, 24, 38),
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Icon(
              Icons.movie_creation_outlined,
              color: Color.fromARGB(255, 255, 53, 109),
            ),
          ),
          leadingWidth: 25,
          title: !_isSearching
              ? Text(
                  "$_movies",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                )
              : Text(
                  "Search",
                  style: TextStyle(
                    color: Color.fromARGB(255, 114, 113, 129),
                  ),
                ),
          elevation: 0,
          actions: <Widget>[
            IconButton(
                icon: !_isSearching
                    ? Icon(Icons.search,
                        color: Color.fromARGB(255, 114, 113, 129))
                    : Icon(Icons.cancel,
                        color: Color.fromARGB(255, 255, 53, 109)),
                onPressed: () {
                  setState(() {});
                }),
          ],
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color.fromARGB(255, 255, 53, 109),
            tabs: <Widget>[
              Tab(
                text: "SM Venues",
              ),
              Tab(
                text: "SM Events",
              ),
              Tab(
                text: "SM Attractions",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FutureBuilder<VenuesModel>(
              future: _venuesModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data.articles.length);
                  return ListView.builder(
                    itemCount: snapshot.data.articles.length,
                    itemBuilder: (context, index) {
                      var article = snapshot.data.articles[index];
                      return ShowsCard(
                        title: article.title,
                        location: article.location,
                        date: article.date,
                        imgSrc: article.imgsrc,
                      );
                    },
                  );
                } else
                  return SpinKitThreeBounce(
                    color: Colors.white,
                    size: 20.0,
                  );
              },
            ),
            FutureBuilder<EventsModel>(
              future: _eventsModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data.articles.length);
                  return ListView.builder(
                    itemCount: snapshot.data.articles.length,
                    itemBuilder: (context, index) {
                      var article = snapshot.data.articles[index];
                      return ShowsCard(
                        title: article.title,
                        location: article.location,
                        date: article.date,
                        imgSrc: article.imgsrc,
                      );
                    },
                  );
                } else
                  return SpinKitThreeBounce(
                    color: Colors.white,
                    size: 20.0,
                  );
              },
            ),
            FutureBuilder<AttractionsModel>(
              future: _attractionsModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data.articles.length);
                  return ListView.builder(
                    itemCount: snapshot.data.articles.length,
                    itemBuilder: (context, index) {
                      var article = snapshot.data.articles[index];
                      return ShowsCard(
                        title: article.title,
                        location: article.location,
                        date: article.date,
                        imgSrc: article.imgsrc,
                      );
                    },
                  );
                } else
                  return SpinKitThreeBounce(
                    color: Colors.white,
                    size: 20.0,
                  );
              },
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 25, 24, 38),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 25, 24, 38),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color.fromARGB(255, 255, 53, 109),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_sharp),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
