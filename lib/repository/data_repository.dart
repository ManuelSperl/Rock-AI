import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:rock_ai/models/homogeneous_area.dart';


class DataRepository {
  // The top-level collection is called database_hgAreas.
  // It stores a reference to this in the "collection" variable.
  final CollectionReference collection = FirebaseFirestore.instance.collection('database_hgAreas');

  // Snapshots method to get a stream of snapshots.
  // This listens for updates automatically.
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  // Note: Document ID is passed with the call and then set here
  Future<void> addHomogeneousArea(HomogeneousArea homogeneousArea, String referenceID) async {
    Map<String, dynamic> homogeneousAreaJSON = homogeneousArea.toJson();

    return collection.doc(referenceID).set(homogeneousAreaJSON);
  }

  // Similar to adding a new Homogeneous Area, this method uses the collection
  // reference to update an existing Homogeneous Area using its ID.
  void updateHomogeneousArea(HomogeneousArea homogeneousArea) async {
    Map<String, dynamic> homogeneousAreaJSON = homogeneousArea.toJson();

    await collection.doc(homogeneousArea.referenceId).update(homogeneousAreaJSON);
  }

  // Same as updating, except the Homogeneous Area is deleted using its ID.
  void deleteHomogeneousArea(HomogeneousArea homogeneousArea) async {
    await collection.doc(homogeneousArea.referenceId).delete();
  }
}
