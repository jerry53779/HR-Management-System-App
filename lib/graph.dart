import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  final String graphImage;

  Graph({required this.graphImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 100,child:Image.network(graphImage,fit: BoxFit.cover,),);
  }
}
