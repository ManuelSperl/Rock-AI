import 'package:flutter/material.dart';

import 'package:rock_ai/models/homogeneous_area.dart';
import 'package:rock_ai/screens/homogeneous_area_detail_screen.dart';



class HomogeneousAreaRoomScreen extends StatelessWidget {
  final HomogeneousArea homogeneousArea;

  const HomogeneousAreaRoomScreen({Key? key, required this.homogeneousArea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(homogeneousArea.referenceId ?? ""),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: HomogeneousAreaDetailScreen(homogeneousArea: homogeneousArea),
    );
  }
}
