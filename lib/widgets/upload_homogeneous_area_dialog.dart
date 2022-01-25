import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:rock_ai/models/homogeneous_area.dart';
import 'package:rock_ai/repository/data_repository.dart';
import 'package:rock_ai/screens/upload_image_screen.dart';



class UploadHomogeneousAreaDialog extends StatefulWidget {
  const UploadHomogeneousAreaDialog({Key? key}) : super(key: key);

  @override
  _UploadHomogeneousAreaDialogState createState() => _UploadHomogeneousAreaDialogState();
}

class _UploadHomogeneousAreaDialogState extends State<UploadHomogeneousAreaDialog> {
  String? newhomogeneousAreaID;

  final DataRepository repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Homogeneous Area'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a Homogeneous Area ID',
              ),
              onChanged: (text) => newhomogeneousAreaID = text,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            if (newhomogeneousAreaID != null) {
              // get the existing ID's to check if you want to overwrite an existing ID
              final snapShot = await FirebaseFirestore.instance
                  .collection('database_hgAreas')
                  .doc(newhomogeneousAreaID) // the ID of the new Homogeneous Area
                  .get();

              // Checks that you enter a unique ID
              if (!snapShot.exists) {
                final newHomogeneousArea = HomogeneousArea();
                repository.addHomogeneousArea(newHomogeneousArea, newhomogeneousAreaID!);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => UploadImageScreen(newhomogeneousAreaID!)))
                    .whenComplete(() => Navigator.of(context).pop());
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "ERROR: You can not add an Homogeneous Area with an existing ID!",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                    );
                  },
                );
                throw ("Homogeneous Area ID already existing!");
              }
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
