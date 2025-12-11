import 'package:flutter/material.dart';
import 'data/recipes.dart';
import 'models/recipe.dart';
import 'screens/recipes_screen.dart';
import 'screens/result_screen.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  String currentScreen = "recipes-screen";

  // selectedRatings is initially filled with empty strings because the rating is not yet given.
  List<String> selectedRatings = List.filled(recipes.length, "");

  String topRecipeName() {
    int bestValue = -1;
    String bestName = "";

    for (int i = 0; i < recipes.length; i++) {
      if (selectedRatings[i].isNotEmpty) {
        int value = emojiToValue[selectedRatings[i]]!;
        if (value > bestValue) {
          bestValue = value;
          bestName = recipes[i].recipeName;
        }
      }
    }
    return bestName;
  }

  void submit() {
    setState(() {
      if (selectedRatings.length == recipes.length)
        currentScreen = 'result_screen';
    });
  }

  void _restart() {
    setState(() {
      selectedRatings = List.filled(recipes.length, "");
      currentScreen = "recipes-screen";
    });
  }

  double Function() get averageRating {
    double average = 1;
    int sum = 0;
    for (int i = 0; i < recipes.length; i++) {
      if (selectedRatings[i].isNotEmpty) sum++;
    }
    average = sum / recipes.length;
  }
     void _selectRating(String rating,int index){




     }









  @override
  Widget build(BuildContext context) {
    Widget? screenWidget;
if (currentScreen=='result_screen'){
  screenWidget=ResultScreen(averageRating: averageRating,topRecipeName: bestName,onRestart: restart,)
} 
else if(currentScreen=='recipe_screen'){

  screenWidget=RecipesScreen(onSelectRating: selectRating,onSubmit:submit ,)
}
    return Scaffold(
      body: screenWidget,
      backgroundColor: const Color.fromARGB(255, 73, 168, 122),
    );
  }
}
