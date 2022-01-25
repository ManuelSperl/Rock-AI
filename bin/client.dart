import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:protobuf/protobuf.dart';
import 'package:protoc_plugin/protoc.dart';
import 'package:rock_ai/grpc_databaseStructure.dart';

import 'server.dart';

void main() async {
  Set<String> rockAI;
  //clientchannel
  final channel = FirebaseDatabase();

  /*final stub = HomogenbereichService();

  var response = await stub.gethb(hbRequest());*/
}
