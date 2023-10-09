import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/remote/api_manager.dart';
import 'package:news_app/screens/category_screen.dart';
import 'package:news_app/screens/home/news_screen.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/screens/tabs_screen.dart';
import 'package:news_app/widgets/drawer_widget.dart';

import '../models/SourcesResponse.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      drawer: Drawer(
        child: DrawerWidget(onDrawerClicked),
      ),
      body: categoryModel == null ? CategoryScreen(onCategorySelected) : NewsScreen(categoryModel!)
    );
  }

  CategoryModel? categoryModel = null;

  void onCategorySelected(category){
    categoryModel=category;
    setState(() {

    });
  }

  void onDrawerClicked(number){
    if(number == DrawerWidget.CatEGORY){
      categoryModel = null;
      setState(() {
        Navigator.pop(context);
      });
    }else if(number == DrawerWidget.SETTINGS){
      SettingsScreen();
      setState(() {
        Navigator.pop(context);


        
      });
    }
  }
}
