import 'package:flutter/material.dart';

import 'package:rock_ai/models/homogeneous_area.dart';
import 'package:rock_ai/screens/homogeneous_area_room_screen.dart';


class HomogeneousAreaCard extends StatelessWidget {
  final HomogeneousArea homogeneousArea;
  final TextStyle boldStyle;

  HomogeneousAreaCard({Key? key, required this.homogeneousArea, required this.boldStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(homogeneousArea.referenceId ?? "", style: boldStyle),
              ),
            ),
          ],
        ),
        onTap: () => Navigator.push<Widget>(
          context,
          MaterialPageRoute(
            builder: (context) => HomogeneousAreaRoomScreen(homogeneousArea: homogeneousArea),
          ),
        ),
      ),
    );
  }
}
