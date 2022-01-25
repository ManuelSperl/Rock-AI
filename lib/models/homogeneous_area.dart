import 'package:cloud_firestore/cloud_firestore.dart';

class HomogeneousArea {
  // Define the spezification fields
  String? gebirgsverhaltenstyp;
  String? vegetationseinfluss;
  String? gefaehrdungsklasse;

  // A reference id to a Firestore document representing this Homogeneous Area.
  String? referenceId;

  HomogeneousArea({this.gebirgsverhaltenstyp, this.vegetationseinfluss, this.gefaehrdungsklasse});

  // A constructor to create a Homogeneous Area from a Firestore DocumentSnapshot.
  factory HomogeneousArea.fromSnapshot(DocumentSnapshot snapshot) {
    final newHomogeneousArea = HomogeneousArea.fromJson(snapshot.data() as Map<String, dynamic>);
    newHomogeneousArea.referenceId = snapshot.reference.id;
    return newHomogeneousArea;
  }

  // A constructor to create a Homogeneous Area from JSON.
  factory HomogeneousArea.fromJson(Map<String, dynamic> json) => _homogeneousAreaFromJson(json);

  // Turn this Homogeneous Area into a map of key/value pairs.
  Map<String, dynamic> toJson() => _homogeneousAreaToJson(this);

  @override
  String toString() => 'HomogeneousArea<>';
}

// A function to convert a map of key/value pairs into a Homogeneous Area.
HomogeneousArea _homogeneousAreaFromJson(Map<String, dynamic> json) {
  return HomogeneousArea(
    gebirgsverhaltenstyp: json['gebirgsverhaltenstyp'] as String?,
    vegetationseinfluss: json['vegetationseinfluss'] as String?,
    gefaehrdungsklasse: json['gefaehrdungsklasse'] as String?,
  );
}

// Converts a Homogeneous Area into a map of key/value pairs.
Map<String, dynamic> _homogeneousAreaToJson(HomogeneousArea instance) => <String, dynamic>{
      'gebirgsverhaltenstyp': instance.gebirgsverhaltenstyp,
      'vegetationseinfluss': instance.vegetationseinfluss,
      'gefaehrdungsklasse': instance.gefaehrdungsklasse,
    };
