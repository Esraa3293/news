import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatelessWidget {
  Function onDrawerClicked;
  static const int CatEGORY=1;
  static const int SETTINGS=2;
  DrawerWidget(this.onDrawerClicked);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
          ),
          child: Text("News App!",
            style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerClicked(CatEGORY);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.list, size: 30,),
                SizedBox(width: 15,),
                Text("Categories",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerClicked(SETTINGS);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.settings, size: 30,),
                SizedBox(width: 15,),
                Text("Settings",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
