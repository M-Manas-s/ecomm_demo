import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
class Model3d extends StatelessWidget {
  final String uri;
  const Model3d({ Key? key  , required this.uri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child : 
            Expanded( child :Cube(
              onSceneCreated: (Scene scene){
                scene.world.add(Object(fileName: uri));
                scene.camera.zoom = 5;
              },
              )
            ),
        );
  }
}