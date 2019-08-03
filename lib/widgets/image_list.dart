import 'package:flutter/material.dart';
import '../model/image_model.dart';

class ImageList extends StatelessWidget
{
  final List<ImageModel> imgs;

  ImageList(this.imgs);

  Widget build(context)
  {
    return ListView.builder(
      itemCount: imgs.length,
      itemBuilder: (context, int index)
      {
        return buildImage(imgs[index]);
      },
    );
  }

  Widget buildImage(ImageModel img)
  {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Image.network(img.url),
          Text(img.title),
        ],
      ),
    );
  }
}