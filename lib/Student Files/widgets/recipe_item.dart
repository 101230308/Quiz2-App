import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  final int index;
  final void Function(int, String) onSelectRating;

  const RecipeItem({
    super.key,
    required this.recipe,
    required this.index,
    required this.onSelectRating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(index.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            recipe.recipeName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ...emojiRatings.Map(recipe)=>{
              onPressed:onSelectRating
            };
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
