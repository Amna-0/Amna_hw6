import 'package:hw_6/service/api.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder(
        future: Api().getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.pink,
                rightDotColor: Colors.cyan,
                size: 100,
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            var allMeals = snapshot.data;
            return GridView.builder(
              itemCount: allMeals!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                var meal = allMeals[index];
                return Card(
                  child: Column(
                    children: [
                      Image.network(
                        meal.strMealThumb!,
                        width: 150,
                        height: 150,
                      ),
                      Text(meal.strMeal!),
                    ],
                  ),
                );
              },
            );
          }

          return const Text("NO DATA");
        },
      ),
    );
  }
}