import 'package:flutter/material.dart';
import 'package:flutter_xxx/MealApp/widget/categories_screen.dart';
import 'package:flutter_xxx/MealApp/widget/category_meals_screen.dart';
import 'package:flutter_xxx/MealApp/widget/meal_detail.dart';
import 'data/dummy_data.dart';
void main()=>runApp(MyMealApp());
class MyMealApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'',
      //home: MealApp(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => MealApp(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routName: (ctx) => MealDetailScreen()
      },

    );
  }
}

class MealApp extends StatefulWidget {
  @override
  _MealAppState createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Categories(),
    );
  }
}
