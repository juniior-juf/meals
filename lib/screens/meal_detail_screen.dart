import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;

  const MealDetailScreen(this.onToggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;

    Widget _sectionTitle(BuildContext context, String title) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    Widget _sectionContainer(Widget child) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300],
                offset: Offset(0.0, 0.0),
                blurRadius: 5,
                spreadRadius: 2.5)
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(meal.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              _sectionTitle(context, 'Ingredients'),
              Column(
                children: meal.ingredients
                    .map(
                      (ingredient) => Card(
                        elevation: 5,
                        shadowColor: Colors.grey[100],
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.label,
                              size: 12,
                              color: Colors.amber[200],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 20,
                                ),
                                child: Text(
                                  ingredient,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 20),
              _sectionTitle(context, 'Instructions'),
              _sectionContainer(
                Column(
                  children: meal.steps.map((step) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              '${meal.steps.indexOf(step) + 1}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(step),
                        ),
                        Divider(color: Colors.amber),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Icon(
          isFavorite(meal) ? Icons.favorite : Icons.favorite_border,
          color: Colors.black87,
        ),
        onPressed: () {
          onToggleFavorite(meal);
        },
      ),
    );
  }
}
