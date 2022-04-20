import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home/food/popular_food_details.dart';
import 'package:food_delivery/screens/home/food/recommended_food_detail.dart';
import 'package:food_delivery/screens/home/main_food_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KuEat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecommendedFoodDetail(),
    );
  }
}
