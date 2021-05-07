import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

// Models
import 'models/venuesmodel.dart';
import 'models/eventsmodel.dart';
import 'models/attractionsmodel.dart';

var APILinks = [
  'http://smtickets.herokuapp.com/api/sm_venues?format=json',
  'http://smtickets.herokuapp.com/api/sm_events?format=json',
  'http://smtickets.herokuapp.com/api/sm_attractions?format=json',
];

class SMTicketsAPI {
  Future<VenuesModel> getVenues() async {
    var client = http.Client();
    var venueModel;

    try {
      var response = await client.get(Uri.parse(APILinks[0]));

      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      venueModel = VenuesModel.fromJson(jsonMap);

      return venueModel;

      //venueModel = VenuesModel.fromJson(jsonMap[list.length]);

    } on SocketException {
      print('No Internet connection 😑');
    } on HttpException {
      print("Couldn't find the post 😱");
    } on FormatException {
      print("Bad response format 👎");
    }

    return venueModel;
  }

  Future<EventsModel> getEvents() async {
    var client = http.Client();
    var eventModel;

    try {
      var response = await client.get(Uri.parse(APILinks[1]));

      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      eventModel = EventsModel.fromJson(jsonMap);

      return eventModel;

      //venueModel = VenuesModel.fromJson(jsonMap[list.length]);

    } on SocketException {
      print('No Internet connection 😑');
    } on HttpException {
      print("Couldn't find the post 😱");
    } on FormatException {
      print("Bad response format 👎");
    }

    return eventModel;
  }

  Future<AttractionsModel> getAttractions() async {
    var client = http.Client();
    var attractionsModel;

    try {
      var response = await client.get(Uri.parse(APILinks[2]));

      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      attractionsModel = AttractionsModel.fromJson(jsonMap);

      return attractionsModel;

      //venueModel = VenuesModel.fromJson(jsonMap[list.length]);

    } on SocketException {
      print('No Internet connection 😑');
    } on HttpException {
      print("Couldn't find the post 😱");
    } on FormatException {
      print("Bad response format 👎");
    }

    return attractionsModel;
  }
}
