import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/data.dart';
import '../model/wallpaper_model.dart';
import '../widgets/widget.dart';

class Category extends StatefulWidget {
  final String? CategoryName;

  Category({this.CategoryName});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController searchController = new TextEditingController();
  List<WallpaperModel> wallpapers = <WallpaperModel>[];

  SearchWallpaper(String query) async {
    var response = await http.get(
        Uri.parse(
            'https://api.pexels.com/v1/search?query=$query&per_page=30&page=1'),
        headers: {"Authorization": apiKey});
    // print(response.body.toString()); // this shows the body which is returned by the api.
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      // print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    //(recreate) or (changes state of) the home screen with newly fetched curated wallpaper-
    setState(() {});
  }

  @override
  void initState() {
    SearchWallpaper(widget.CategoryName.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        backgroundColor: Colors.white, //bg color of app bar.
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [

            SizedBox(height: 16,),

            wallpapersList(wallpapers: wallpapers, context: context),
          ],),
        ),
      ),
    );
  }
}