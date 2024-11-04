import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:actividad_02/modules/home/entities/restaurant.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                restaurant.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restaurant.images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.network(
                      restaurant.images[index],
                      fit: BoxFit.cover,
                      width: 200,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: StarRating(
                rating: restaurant.rating / restaurant.count,
                starCount: 5,
                size: 30,
                color: Colors.amber,
                borderColor: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                restaurant.description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Comentarios",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      "Todavía no hay comentarios equisde",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(restaurant.latitude, restaurant.longitude),
                  zoom: 15,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId(restaurant.name),
                    position: LatLng(restaurant.latitude, restaurant.longitude),
                    infoWindow: InfoWindow(title: restaurant.name),
                  )
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
