import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/style/my_theme.dart';

class CategoryModel {
  String id;
  String name;
  String imagePath;
  Color color;

  CategoryModel(this.id, this.name, this.imagePath, this.color);

  static List<CategoryModel> getCategories() {
    return [
    CategoryModel("business", "Business", "assets/images/business.png", MyThemeData.brownColor),
    CategoryModel("entertainment", "Entertainment", "assets/images/environment.png", MyThemeData.lightBlueColor),
    CategoryModel("general", "General", "assets/images/Politics.png", MyThemeData.darkBlueColor),
    CategoryModel("health", "Health", "assets/images/health.png", MyThemeData.pinkColor),
    CategoryModel("science", "Science", "assets/images/science.png", MyThemeData.yellowColor),
    CategoryModel("sports", "Sports", "assets/images/sports.png", MyThemeData.redColor),
    CategoryModel("technology", "Technology", "assets/images/science.png", Colors.green)
    ];
  }
}