import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:rock_ai/models/homogeneous_area.dart';
import 'package:rock_ai/repository/data_repository.dart';
import 'package:rock_ai/widgets/choose_chips.dart';



class HomogeneousAreaDetailScreen extends StatefulWidget {
  final HomogeneousArea homogeneousArea;

  const HomogeneousAreaDetailScreen({Key? key, required this.homogeneousArea}) : super(key: key);

  @override
  _HomogeneousAreaDetailState createState() => _HomogeneousAreaDetailState();
}

class _HomogeneousAreaDetailState extends State<HomogeneousAreaDetailScreen> {
  final DataRepository repository = DataRepository();
  final _formKey = GlobalKey<FormState>();
  late List<CategoryOption> gebirgsverhaltensTypes;
  late List<CategoryOption> vegetationseinflussTypes;
  late List<CategoryOption> gefaehrdungsklassenTypes;

  String? gebirgsverhaltenstyp;
  String? vegetationseinfluss;
  String? gefaehrdungsklasse;

  late String imageURL;
  var imageURLs = [];

  @override
  void initState() {
    gebirgsverhaltenstyp = widget.homogeneousArea.gebirgsverhaltenstyp;
    vegetationseinfluss = widget.homogeneousArea.vegetationseinfluss;
    gefaehrdungsklasse = widget.homogeneousArea.gefaehrdungsklasse;

    gebirgsverhaltensTypes = [
      CategoryOption(type: 'standfest', name: 'Standfest', isSelected: gebirgsverhaltenstyp == 'standfest'),
      CategoryOption(
          type: 'nachbrüchig', name: 'Nachbrüchig', isSelected: gebirgsverhaltenstyp == 'nachbrüchig'),
      CategoryOption(
          type: 'aufgelockert', name: 'Aufgelockert', isSelected: gebirgsverhaltenstyp == 'aufgelockert'),
      CategoryOption(type: 'zerlegt', name: 'Zerlegt', isSelected: gebirgsverhaltenstyp == 'zerlegt'),
    ];

    vegetationseinflussTypes = [
      CategoryOption(type: 'kein', name: 'Kein', isSelected: vegetationseinfluss == 'kein'),
      CategoryOption(
          type: 'verbessernd', name: 'Verbessernd', isSelected: vegetationseinfluss == 'verbessernd'),
      CategoryOption(
          type: 'verschlechternd',
          name: 'Verschlechternd',
          isSelected: vegetationseinfluss == 'verschlechternd'),
    ];

    gefaehrdungsklassenTypes = [
      CategoryOption(
          type: 'sehr gering', name: 'Sehr gering', isSelected: gefaehrdungsklasse == 'sehr gering'),
      CategoryOption(type: 'gering', name: 'Gering', isSelected: gefaehrdungsklasse == 'gering'),
      CategoryOption(type: 'mittel', name: 'Mittel', isSelected: gefaehrdungsklasse == 'mittel'),
      CategoryOption(type: 'hoch', name: 'Hoch', isSelected: gefaehrdungsklasse == 'hoch'),
    ];

    getImageURLsFromDatabase();

    super.initState();
  }

  Future delayFutureBuilder() {
    debugPrint('Future delay call');
    return Future.delayed(Duration(milliseconds: 5));
  }

  getImageURLsFromDatabase() async {
    FirebaseFirestore.instance
        .collection('database_hgAreas')
        .doc(widget.homogeneousArea.referenceId)
        .get()
        .then((value) {
      // get the image-URLs and add them into the List
      value.data()!['images'].forEach((element) {
        imageURLs.add(element);
        //print(element); // only for testing
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      height: double.infinity,
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 5.0),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('database_hgAreas')
                    .doc(widget.homogeneousArea.referenceId)
                    .snapshots(),
                builder: (context, snapshot) {
                  return FutureBuilder<dynamic>(
                    future: delayFutureBuilder(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      return Container(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: imageURLs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) {
                                  return ImageDetailScreen(imageURLs[index]);
                                }));
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 4, right: 4, top: 5),
                                child: Image(image: NetworkImage(imageURLs[index])),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 10.0),
              Divider(color: Colors.grey),
              ChooseType(
                title: 'Gebirgsverhaltenstyp:',
                options: gebirgsverhaltensTypes,
                onOptionTap: (value) {
                  setState(() {
                    gebirgsverhaltensTypes.forEach((element) {
                      gebirgsverhaltenstyp = value.type;
                      element.isSelected = element.type == value.type;
                    });
                  });
                },
              ),
              Divider(color: Colors.grey),
              ChooseType(
                title: 'Vegetationseinflusstyp:',
                options: vegetationseinflussTypes,
                onOptionTap: (value) {
                  setState(() {
                    vegetationseinflussTypes.forEach((element) {
                      vegetationseinfluss = value.type;
                      element.isSelected = element.type == value.type;
                    });
                  });
                },
              ),
              Divider(color: Colors.grey),
              ChooseType(
                title: 'Gefährdungsklassentyp:',
                options: gefaehrdungsklassenTypes,
                onOptionTap: (value) {
                  setState(() {
                    gefaehrdungsklassenTypes.forEach((element) {
                      gefaehrdungsklasse = value.type;
                      element.isSelected = element.type == value.type;
                    });
                  });
                },
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.grey.shade600,
                    onPressed: () {
                      Navigator.of(context).pop();
                      repository.deleteHomogeneousArea(widget.homogeneousArea);
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.grey.shade600,
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.of(context).pop();

                        widget.homogeneousArea.gebirgsverhaltenstyp = gebirgsverhaltenstyp;
                        widget.homogeneousArea.vegetationseinfluss = vegetationseinfluss;
                        widget.homogeneousArea.gefaehrdungsklasse = gefaehrdungsklasse;

                        repository.updateHomogeneousArea(widget.homogeneousArea);
                      }
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageDetailScreen extends StatelessWidget {
  final String imageURL;

  ImageDetailScreen(this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: GestureDetector(
        child: Center(
          child: Image.network(imageURL),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
