import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:rock_ai/models/homogeneous_area.dart';
import 'package:rock_ai/repository/data_repository.dart';
import 'package:rock_ai/widgets/homogeneous_area_card.dart';
import 'package:rock_ai/widgets/upload_homogeneous_area_dialog.dart';




class HomeListScreen extends StatefulWidget {
  const HomeListScreen({Key? key}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeListScreen> {
  final DataRepository repository = DataRepository();

  final boldStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return _buildHome(context);
  }

  Widget _buildHome(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rock AI'),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: repository.getStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return LinearProgressIndicator();

            return _buildList(context, snapshot.data?.docs ?? []);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _uploadHomogeneousArea();
        },
        backgroundColor: Colors.grey[600],
        tooltip: 'Upload Homogeneous Area',
        child: Icon(Icons.upload),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey,
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: Container(
            height: 22,
          ),
        ),
    );
  }

  void _uploadHomogeneousArea() {
    showDialog<Widget>(
      context: context,
      builder: (BuildContext context) {
        return UploadHomogeneousAreaDialog();
      },
    );
  }

  // Method to build the list of Homogeneous Areas on the app screen.
  Widget _buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {
    return ListView(
      padding: EdgeInsets.only(top: 20.0),
      // Maps the list from data, creates a new list item for each one
      // and turns that into a list that the children parameter needs.
      children: snapshot!.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  // Method that builds up individual Homogeneous Area Cards in the "ListView".
  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    // Creates a Homogeneous Area class from the snapshot passed in.
    final homogeneousArea = HomogeneousArea.fromSnapshot(snapshot);

    return HomogeneousAreaCard(homogeneousArea: homogeneousArea, boldStyle: boldStyle);
  }
}
