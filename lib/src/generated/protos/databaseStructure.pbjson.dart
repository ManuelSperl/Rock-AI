///
//  Generated code. Do not modify.
//  source: protos/databaseStructure.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use homogenbereichDescriptor instead')
const Homogenbereich$json = const {
  '1': 'Homogenbereich',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
  '4': const [Homogenbereich_Gebirgsverhaltenstyp$json, Homogenbereich_BERGWASSEREINFLUSS$json, Homogenbereich_Vegetaionseinfluss$json, Homogenbereich_GEFAEHRDUNGSKLASSE$json],
};

@$core.Deprecated('Use homogenbereichDescriptor instead')
const Homogenbereich_Gebirgsverhaltenstyp$json = const {
  '1': 'Gebirgsverhaltenstyp',
  '2': const [
    const {'1': 'STANDFEST', '2': 0},
    const {'1': 'NACHBRUECHIG', '2': 1},
    const {'1': 'AUFGELOCKERT', '2': 2},
    const {'1': 'ZERLEGT', '2': 3},
  ],
};

@$core.Deprecated('Use homogenbereichDescriptor instead')
const Homogenbereich_BERGWASSEREINFLUSS$json = const {
  '1': 'BERGWASSEREINFLUSS',
  '2': const [
    const {'1': 'KEIN_BE', '2': 0},
    const {'1': 'GERING_BE', '2': 1},
    const {'1': 'HOCH', '2': 2},
  ],
};

@$core.Deprecated('Use homogenbereichDescriptor instead')
const Homogenbereich_Vegetaionseinfluss$json = const {
  '1': 'Vegetaionseinfluss',
  '2': const [
    const {'1': 'KEIN_VE', '2': 0},
    const {'1': 'VERBESSERND', '2': 1},
    const {'1': 'VERSCHLECHTERND', '2': 2},
  ],
};

@$core.Deprecated('Use homogenbereichDescriptor instead')
const Homogenbereich_GEFAEHRDUNGSKLASSE$json = const {
  '1': 'GEFAEHRDUNGSKLASSE',
  '2': const [
    const {'1': 'SEHR_GERING_GK', '2': 0},
    const {'1': 'GERING_GK', '2': 1},
    const {'1': 'MITTEL_GK', '2': 2},
    const {'1': 'HOCH_GK', '2': 3},
  ],
};

/// Descriptor for `Homogenbereich`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homogenbereichDescriptor = $convert.base64Decode('Cg5Ib21vZ2VuYmVyZWljaBISCgRuYW1lGAEgASgJUgRuYW1lIlYKFEdlYmlyZ3N2ZXJoYWx0ZW5zdHlwEg0KCVNUQU5ERkVTVBAAEhAKDE5BQ0hCUlVFQ0hJRxABEhAKDEFVRkdFTE9DS0VSVBACEgsKB1pFUkxFR1QQAyI6ChJCRVJHV0FTU0VSRUlORkxVU1MSCwoHS0VJTl9CRRAAEg0KCUdFUklOR19CRRABEggKBEhPQ0gQAiJHChJWZWdldGFpb25zZWluZmx1c3MSCwoHS0VJTl9WRRAAEg8KC1ZFUkJFU1NFUk5EEAESEwoPVkVSU0NITEVDSFRFUk5EEAIiUwoSR0VGQUVIUkRVTkdTS0xBU1NFEhIKDlNFSFJfR0VSSU5HX0dLEAASDQoJR0VSSU5HX0dLEAESDQoJTUlUVEVMX0dLEAISCwoHSE9DSF9HSxAD');
@$core.Deprecated('Use hbRequestDescriptor instead')
const hbRequest$json = const {
  '1': 'hbRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 5, '10': 'name'},
  ],
};

/// Descriptor for `hbRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hbRequestDescriptor = $convert.base64Decode('CgloYlJlcXVlc3QSEgoEbmFtZRgBIAEoBVIEbmFtZQ==');
@$core.Deprecated('Use hbResponseDescriptor instead')
const hbResponse$json = const {
  '1': 'hbResponse',
  '2': const [
    const {'1': 'hbs', '3': 1, '4': 3, '5': 11, '6': '.Homogenbereich', '10': 'hbs'},
  ],
};

/// Descriptor for `hbResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hbResponseDescriptor = $convert.base64Decode('CgpoYlJlc3BvbnNlEiEKA2hicxgBIAMoCzIPLkhvbW9nZW5iZXJlaWNoUgNoYnM=');
const $core.Map<$core.String, $core.dynamic> HomogenbereichServiceBase$json = const {
  '1': 'HomogenbereichService',
  '2': const [
    const {'1': 'gethb', '2': '.hbRequest', '3': '.hbResponse', '4': const {}},
  ],
};

@$core.Deprecated('Use homogenbereichServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> HomogenbereichServiceBase$messageJson = const {
  '.hbRequest': hbRequest$json,
  '.hbResponse': hbResponse$json,
  '.Homogenbereich': Homogenbereich$json,
};

/// Descriptor for `HomogenbereichService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List homogenbereichServiceDescriptor = $convert.base64Decode('ChVIb21vZ2VuYmVyZWljaFNlcnZpY2USIgoFZ2V0aGISCi5oYlJlcXVlc3QaCy5oYlJlc3BvbnNlIgA=');
