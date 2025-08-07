import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotoCanvasScreen(),
    );
  }
}

class PhotoCanvasScreen extends StatelessWidget {
  final List<String> photoUrls = [
    'asset/images/img1.jpg',
    'asset/images/img2.jpg',
    'asset/images/img3.jpg',
    'asset/images/img4.jpg',
    'asset/images/img5.jpg',
    'asset/images/img6.jpg',
    'asset/images/img7.jpg',
    'asset/images/img8.jpg',
    'asset/images/img9.jpg',
    'asset/images/img10.jpg',
    'asset/images/img11.jpg',
    'asset/images/img12.jpg',
  ];

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    double imageSize = screenWidth / 3 - 10;
    double imageHeight = screenHeight / 4 - 10;

    return Scaffold(
      appBar: AppBar(
        title: Text('Scenery'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.builder(
          itemCount: photoUrls.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: (imageSize / imageHeight),
          ),
          itemBuilder: (context, index) {
            return Container(
              width: imageSize,
              height: imageHeight,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.grey[200],
              ),
              child: photoUrls[index].isEmpty
                  ? Center(child: Text('No Photo'))
                  : Image.asset(photoUrls[index], fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}
