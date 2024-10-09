import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pixelscape/main.dart';

class ImageView extends StatefulWidget {
  final String ?imgUrl;
  ImageView({required this.imgUrl});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {

  var filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Hero(
          tag: widget.imgUrl.toString(),
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.imgUrl.toString(), fit: BoxFit.cover,)),
        ),

        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                //_save();//saving the image to gallery
              },
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff1C1B1B).withOpacity(0.8),
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width/2,

                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/2,
                  padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54, width: 2),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: [
                        Color(0x36FFFFFF),
                        Color(0x0FFFFFFF),
                      ])
                  ),
                  child: Column(
                    children: <Widget>[
                      Text("Set Wallpaper", style: TextStyle(fontSize: 16, color: Colors.white60),),
                      Text("Image will be saved in gallery", style: TextStyle(fontSize: 10, color: Colors.white60,),),
                    ],),
                ),
              ],
              ),
            ),

            SizedBox(height: 10,),

            Text("Cancel", style: TextStyle(color: Colors.white),),

            SizedBox(height: 50,),
          ],),
        ),
      ],),
    );
  }

  // _save() async{
  //   if(Platform.isAndroid){
  //     await _askPermission();
  //   }
  //   var response = await Dio().get(
  //     widget.imgUrl.toString(),
  //       options: Options(responseType: ResponseType.bytes));
  //   final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
  //   print(result);
  //   Navigator.pop(context);
  // }

  // // Function to request permission
  // _askPermission() async {
  //   if (Platform.isIOS) {
  //     // Request permission for photos on iOS
  //     var status = await Permission.photos.request();
  //     if (status.isGranted) {
  //       print('Permission granted for photos');
  //     } else {
  //       print('Permission denied for photos');
  //     }
  //   } else {
  //     // Request permission for storage on Android
  //     var status = await Permission.storage.request();
  //     if (status.isGranted) {
  //       print('Permission granted for storage');
  //     } else {
  //       print('Permission denied for storage');
  //     }
  //   }
  // }
}
