import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  CategoryModel categoryModel;
  int index;

  CategoryWidget(this.categoryModel, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(index % 2 == 0 ? 30 : 0),
            bottomRight: Radius.circular(index % 2 != 0 ? 30 : 0)),
      ),
      child: Column(
        children: [
          Image.asset(
            categoryModel.imagePath,
            height: 150,
          ),
          Text(
            categoryModel.name,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
          )
        ],
      ),
    );
  }
}
