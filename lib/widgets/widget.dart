import 'package:flutter/material.dart';
import 'package:pixelscape/model/wallpaper_model.dart';

import '../views/image_view.dart';

Widget brandName() {
  return Center(
    child: RichText(
      text: const TextSpan(
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        children: <TextSpan>[
          TextSpan(
            text: 'Pixel',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(text: 'Scape', style: TextStyle(color: Colors.blue)),
        ],
      ),
    ),
  );
}

Widget wallpapersList({List<WallpaperModel>? wallpapers, context}) {
  //wallpaper made nullable by ?
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers!.map((Wallpaper) {
        //map made nullable by !.
        return GridTile(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ImageView(
                  imgUrl: Wallpaper.src!.portrait,
                )));
              },
              child: Hero(
                tag: Wallpaper.src!.portrait,
                child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    Wallpaper.src!.portrait,
                    fit: BoxFit.cover,
                  )),
                        ),
              ),
            ));
      }).toList(),
    ),
  );
}
