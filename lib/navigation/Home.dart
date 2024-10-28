import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class Restaurant {
  final String name;
  final String description;
  final List<String> images;
  final double rating;
  final int count;

  Restaurant(this.name, this.description, this.images, this.rating, this.count);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = FirebaseFirestore.instance;
  final List<Restaurant> _restaurants = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();

    (() async {
      await db.collection("restaurants").get().then((event) {
        for (var doc in event.docs) {
          final restaurant = Restaurant(
            doc.data()['name'],
            doc.data()['description'],
            List<String>.from(doc.data()['images']),
            doc.data()['rating'].toDouble(),
            doc.data()['count'].toInt(),
          );
          _restaurants.add(restaurant);
        }

        if (mounted) {
          setState(() {
            loading = false;
          });
        }
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: _restaurants.isNotEmpty
            ? ListView.builder(
                itemCount: _restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = _restaurants[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        restaurant.images.isNotEmpty
                            ? Image.network(
                                restaurant.images[0],
                                width: 70,
                                height: 70,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error);
                                },
                              )
                            : const Icon(Icons.image_not_supported),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant.name,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(restaurant.description),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StarRating(
                              rating: restaurant.rating,
                              starCount: 5,
                              size: 20,
                              color: Colors.amber,
                              borderColor: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
            : const Center(child: Text('No hay restaurantes disponibles')),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.amber,
        onPressed: () => Navigator.pushNamed(context, '/home'),
        child: const Icon(Icons.home),
      ),
    );
  }
}
