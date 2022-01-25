// import 'package:/grpc/grpc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:protobuf/protobuf.dart';
import 'package:protoc_plugin/protoc.dart';
import 'package:rock_ai/grpc_databaseStructure.dart';

// @HomogenbereichServiceBase is also autocreated
class HomogenbereichService extends HomogenbereichServiceBase {
  HomogenbereichService(ClientApiGenerator channel);

  @override
  Future<hbResponse> gethb(ServerContext ctx, hbRequest request) async {
    final hbList = hbs
    .map(Homogenbereich) => Homogenbereich.fromJason('{"gebirgsverhaltenstyp": ${Homogenbereich_Gebirgsverhaltenstyp}, "vegetationseinfluss": "${Homogenbereich_Vegetaionseinfluss}, "gefaehrdungsklasse": ${Homogenbereich_GEFAEHRDUNGSKLASSE}"}')
    .toList(); 
    return hbResponse()..hbs.addAll(hbList);
  }
}

void main() async {
  final server = FirebaseDatabase();
}
