///
//  Generated code. Do not modify.
//  source: protos/databaseStructure.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Homogenbereich_Gebirgsverhaltenstyp extends $pb.ProtobufEnum {
  static const Homogenbereich_Gebirgsverhaltenstyp STANDFEST = Homogenbereich_Gebirgsverhaltenstyp._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STANDFEST');
  static const Homogenbereich_Gebirgsverhaltenstyp NACHBRUECHIG = Homogenbereich_Gebirgsverhaltenstyp._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NACHBRUECHIG');
  static const Homogenbereich_Gebirgsverhaltenstyp AUFGELOCKERT = Homogenbereich_Gebirgsverhaltenstyp._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AUFGELOCKERT');
  static const Homogenbereich_Gebirgsverhaltenstyp ZERLEGT = Homogenbereich_Gebirgsverhaltenstyp._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ZERLEGT');

  static const $core.List<Homogenbereich_Gebirgsverhaltenstyp> values = <Homogenbereich_Gebirgsverhaltenstyp> [
    STANDFEST,
    NACHBRUECHIG,
    AUFGELOCKERT,
    ZERLEGT,
  ];

  static final $core.Map<$core.int, Homogenbereich_Gebirgsverhaltenstyp> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Homogenbereich_Gebirgsverhaltenstyp? valueOf($core.int value) => _byValue[value];

  const Homogenbereich_Gebirgsverhaltenstyp._($core.int v, $core.String n) : super(v, n);
}

class Homogenbereich_BERGWASSEREINFLUSS extends $pb.ProtobufEnum {
  static const Homogenbereich_BERGWASSEREINFLUSS KEIN_BE = Homogenbereich_BERGWASSEREINFLUSS._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'KEIN_BE');
  static const Homogenbereich_BERGWASSEREINFLUSS GERING_BE = Homogenbereich_BERGWASSEREINFLUSS._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GERING_BE');
  static const Homogenbereich_BERGWASSEREINFLUSS HOCH = Homogenbereich_BERGWASSEREINFLUSS._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HOCH');

  static const $core.List<Homogenbereich_BERGWASSEREINFLUSS> values = <Homogenbereich_BERGWASSEREINFLUSS> [
    KEIN_BE,
    GERING_BE,
    HOCH,
  ];

  static final $core.Map<$core.int, Homogenbereich_BERGWASSEREINFLUSS> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Homogenbereich_BERGWASSEREINFLUSS? valueOf($core.int value) => _byValue[value];

  const Homogenbereich_BERGWASSEREINFLUSS._($core.int v, $core.String n) : super(v, n);
}

class Homogenbereich_Vegetaionseinfluss extends $pb.ProtobufEnum {
  static const Homogenbereich_Vegetaionseinfluss KEIN_VE = Homogenbereich_Vegetaionseinfluss._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'KEIN_VE');
  static const Homogenbereich_Vegetaionseinfluss VERBESSERND = Homogenbereich_Vegetaionseinfluss._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERBESSERND');
  static const Homogenbereich_Vegetaionseinfluss VERSCHLECHTERND = Homogenbereich_Vegetaionseinfluss._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERSCHLECHTERND');

  static const $core.List<Homogenbereich_Vegetaionseinfluss> values = <Homogenbereich_Vegetaionseinfluss> [
    KEIN_VE,
    VERBESSERND,
    VERSCHLECHTERND,
  ];

  static final $core.Map<$core.int, Homogenbereich_Vegetaionseinfluss> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Homogenbereich_Vegetaionseinfluss? valueOf($core.int value) => _byValue[value];

  const Homogenbereich_Vegetaionseinfluss._($core.int v, $core.String n) : super(v, n);
}

class Homogenbereich_GEFAEHRDUNGSKLASSE extends $pb.ProtobufEnum {
  static const Homogenbereich_GEFAEHRDUNGSKLASSE SEHR_GERING_GK = Homogenbereich_GEFAEHRDUNGSKLASSE._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SEHR_GERING_GK');
  static const Homogenbereich_GEFAEHRDUNGSKLASSE GERING_GK = Homogenbereich_GEFAEHRDUNGSKLASSE._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GERING_GK');
  static const Homogenbereich_GEFAEHRDUNGSKLASSE MITTEL_GK = Homogenbereich_GEFAEHRDUNGSKLASSE._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MITTEL_GK');
  static const Homogenbereich_GEFAEHRDUNGSKLASSE HOCH_GK = Homogenbereich_GEFAEHRDUNGSKLASSE._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HOCH_GK');

  static const $core.List<Homogenbereich_GEFAEHRDUNGSKLASSE> values = <Homogenbereich_GEFAEHRDUNGSKLASSE> [
    SEHR_GERING_GK,
    GERING_GK,
    MITTEL_GK,
    HOCH_GK,
  ];

  static final $core.Map<$core.int, Homogenbereich_GEFAEHRDUNGSKLASSE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Homogenbereich_GEFAEHRDUNGSKLASSE? valueOf($core.int value) => _byValue[value];

  const Homogenbereich_GEFAEHRDUNGSKLASSE._($core.int v, $core.String n) : super(v, n);
}

