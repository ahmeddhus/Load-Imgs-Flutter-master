import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'model/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return AppState();
  }
}

class AppState extends State<App>
{
  int counter = 0;
  List<ImageModel> imgs = [];

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(imgs),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: fetchImg,
        ),
        appBar: AppBar(
          title: Text('Let\'s see some images!'),
        ),
      ),
    );
  }

  void fetchImg() async
  {
    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');

    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(()
    {
      imgs.add(imageModel);
    });

  }
}