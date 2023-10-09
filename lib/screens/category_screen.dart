import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/style/my_theme.dart';
import 'package:news_app/widgets/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  var categories = CategoryModel.getCategories();
  Function onCategorySelected;

  CategoryScreen(this.onCategorySelected);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/pattern.png"),
                  fit: BoxFit.fill)),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Pick your category \nof interest",
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) =>
                      InkWell(
                        onTap: () {
                          onCategorySelected(categories[index]);
                        },
                          child: CategoryWidget(categories[index], index)),
                  itemCount: categories.length,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
