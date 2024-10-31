import 'package:actividad_02/widgets/home/list_restaurant_data.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:actividad_02/modules/home/entities/restaurant.dart';

//AIzaSyBRMfK6zDd0Mk9YNlK3q2j3b7a65G_-B6M - KEY global

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final db = FirebaseFirestore.instance;
  final List<Restaurant> _restaurants = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();

    db.collection("restaurants").snapshots().listen((event) {
      List<Restaurant> newRestaurants = [];
      for (var doc in event.docs) {
        final restaurant = Restaurant(
          doc.data()['name'],
          doc.data()['description'],
          List<String>.from(doc.data()['images']),
          doc.data()['rating'].toDouble(),
          doc.data()['count'].toInt(),
        );
        newRestaurants.add(restaurant);
      }

      if (mounted) {
        setState(() {
          _restaurants.clear();
          _restaurants.addAll(newRestaurants);
          loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListRestaurantData(
      loading: loading,
      restaurants: _restaurants,
      context: context,
    );
  }
}
