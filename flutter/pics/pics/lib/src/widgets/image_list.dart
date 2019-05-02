import 'package:flutter/material.dart';
import '../models/ImageModel.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return buildImage(images[index]);
        //return ;
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10), child: Image.network(image.url),),
          Text(image.title)
        ],
      ),
    );
  }
}
