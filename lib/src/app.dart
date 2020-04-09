// Import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

// Create a class that will be our custom widget
// This class must extend the 'StatelessWidget' base class
class App extends StatefulWidget {
  AppState createState() => AppState();
}

class AppState extends State<App> {
  int counter = 1;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    final response =
        await http.get('http://jsonplaceholder.typicode.com/photos/$counter');
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() => images.add(imageModel));
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Let\'s see some images'),
          backgroundColor: Colors.pink,
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(
            Icons.add,
            size: 32.0,
          ),
          backgroundColor: Colors.pink,
          tooltip: 'Click me',
        ),
      ),
    );
  }
}
