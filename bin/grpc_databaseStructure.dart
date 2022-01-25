import 'package:rock_ai/grpc_databaseStructure.dart';

void main(List<String> arguments) {
  final hb = Homogenbereich()..name = 'Homogenbreich name';
  print(hb);

  final hb2 = Homogenbereich.fromJson(
      '{"gebirgsverhaltenstyp": ${Homogenbereich_Gebirgsverhaltenstyp}, "vegetationseinfluss": "${Homogenbereich_Vegetaionseinfluss}, "gefaehrdungsklasse": ${Homogenbereich_GEFAEHRDUNGSKLASSE}"}');
  print(hb.writeToJson());
}
