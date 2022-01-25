///
//  Generated code. Do not modify.
//  source: protos/databaseStructure.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'databaseStructure.pb.dart' as $0;
import 'databaseStructure.pbjson.dart';

export 'databaseStructure.pb.dart';

abstract class HomogenbereichServiceBase extends $pb.GeneratedService {
  $async.Future<$0.hbResponse> gethb($pb.ServerContext ctx, $0.hbRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'gethb': return $0.hbRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'gethb': return this.gethb(ctx, request as $0.hbRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => HomogenbereichServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => HomogenbereichServiceBase$messageJson;
}

