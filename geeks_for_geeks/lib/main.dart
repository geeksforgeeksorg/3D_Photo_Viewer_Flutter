import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 3D',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Declare a variable to hold the 3D model of the jet
  late Object jet;
  // Declare a variable to hold the 3D model of the shark
  late Object shark;

  @override
  void initState() {
    // Load the 3D model of the jet
    jet = Object(fileName: "assets/jet/Jet.obj");
    // Load the 3D model of the shark
    shark = Object(fileName: "assets/shark/shark.obj");
    // Rotate the shark model
    shark.rotation.setValues(0, 90, 0);
    // Update the transformation of the shark model
    shark.updateTransform();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Set the background color of the app bar
        backgroundColor: Colors.green,
        // Set the foreground color of the app bar
        foregroundColor: Colors.white,
        // Set the title of the app bar
        title: Text("Flutter 3D"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Cube(
                onSceneCreated: (Scene scene) {
                  // Add the shark model to the scene
                  scene.world.add(shark);
                  // Set the camera zoom level
                  scene.camera.zoom = 10;
                },
              ),
            ),
            Expanded(
              child: Cube(
                onSceneCreated: (Scene scene) {
                  // Add the jet model to the scene
                  scene.world.add(jet);
                  // Set the camera zoom level
                  scene.camera.zoom = 10;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
