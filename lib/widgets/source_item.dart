import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/style/my_theme.dart';

class SourceItem extends StatelessWidget {
  Sources source;
  bool isSelected;
  SourceItem(this.source,this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? MyThemeData.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: MyThemeData.primaryColor, width: 2)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(source.name??"",
          style: TextStyle(color: isSelected ? Colors.white : MyThemeData.primaryColor),
        ),
      ),
    );
  }
}
