import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

import 'package:rock_ai/models/homogeneous_area.dart';
import 'package:rock_ai/screens/homogeneous_area_room_screen.dart';



class UploadImageScreen extends StatefulWidget {
  final String? homogeneousAreaID;

  UploadImageScreen(this.homogeneousAreaID, {Key? key}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImageScreen> {
  bool uploading = false;
  double val = 0;
  late CollectionReference imageReference;
  late firebase_storage.Reference reference;

  List<File> _images = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Images"),
        actions: [
          FlatButton(
            onPressed: () {
              setState(() {
                uploading = true;
              });
              uploadFile()
                ..whenComplete(() async {
                  var snapShot = await FirebaseFirestore.instance
                      .collection('database_hgAreas')
                      .doc(widget.homogeneousAreaID) // the ID of the new Homogeneous Area
                      .get();
                  var homogeneousArea = HomogeneousArea.fromSnapshot(snapShot);
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => HomogeneousAreaRoomScreen(homogeneousArea: homogeneousArea),
                        ),
                      )
                      .whenComplete(
                        () => Navigator.of(context).pop(),
                      );
                });
            },
            child: Text("Upload"),
          ),
        ],
      ),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: _images.length + 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return index == 0
                  ? Center(
                      child: IconButton(
                        icon: Icon(Icons.add_photo_alternate_outlined),
                        onPressed: () {
                          // disables the add-Button, when you upload the images
                          !uploading ? chooseImage() : null;
                        },
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(_images[index - 1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
            },
          ),
          uploading
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          'Uploading...',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 10),
                      CircularProgressIndicator(
                        // goes from 0 = 0%, to 1 = 100% in a Circle
                        value: val,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  // Function to choose the Image from the Gallery
  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _images.add(File(pickedFile!.path));
    });
  }

  // Function to upload the Choosen Images to the created hg_Area with it's custom ID
  Future uploadFile() async {
    int index = 1;

    for (var image in _images) {
      setState(() {
        val = index / _images.length;
      });

      reference =
          firebase_storage.FirebaseStorage.instance.ref().child('test_images/${Path.basename(image.path)}');

      await reference.putFile(image).whenComplete(() async {
        await reference.getDownloadURL().then((value) {
          // adds the selected images to the 'images' array
          imageReference.doc(widget.homogeneousAreaID).update({
            'images': FieldValue.arrayUnion([value])
          });

          index++;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();

    imageReference = FirebaseFirestore.instance.collection('database_hgAreas');

    // Adds field "images" from type array and always initializes with empty string
    imageReference.doc(widget.homogeneousAreaID).set({'images': ""});
  }
}
