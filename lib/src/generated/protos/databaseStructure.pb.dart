///
//  Generated code. Do not modify.
//  source: protos/databaseStructure.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'databaseStructure.pbenum.dart';

class Homogenbereich extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Homogenbereich', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  Homogenbereich._() : super();
  factory Homogenbereich({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory Homogenbereich.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Homogenbereich.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Homogenbereich clone() => Homogenbereich()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Homogenbereich copyWith(void Function(Homogenbereich) updates) => super.copyWith((message) => updates(message as Homogenbereich)) as Homogenbereich; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Homogenbereich create() => Homogenbereich._();
  Homogenbereich createEmptyInstance() => create();
  static $pb.PbList<Homogenbereich> createRepeated() => $pb.PbList<Homogenbereich>();
  @$core.pragma('dart2js:noInline')
  static Homogenbereich getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Homogenbereich>(create);
  static Homogenbereich? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class hbRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hbRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  hbRequest._() : super();
  factory hbRequest({
    $core.int? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory hbRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory hbRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  hbRequest clone() => hbRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  hbRequest copyWith(void Function(hbRequest) updates) => super.copyWith((message) => updates(message as hbRequest)) as hbRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static hbRequest create() => hbRequest._();
  hbRequest createEmptyInstance() => create();
  static $pb.PbList<hbRequest> createRepeated() => $pb.PbList<hbRequest>();
  @$core.pragma('dart2js:noInline')
  static hbRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<hbRequest>(create);
  static hbRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get name => $_getIZ(0);
  @$pb.TagNumber(1)
  set name($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class hbResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'hbResponse', createEmptyInstance: create)
    ..pc<Homogenbereich>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hbs', $pb.PbFieldType.PM, subBuilder: Homogenbereich.create)
    ..hasRequiredFields = false
  ;

  hbResponse._() : super();
  factory hbResponse({
    $core.Iterable<Homogenbereich>? hbs,
  }) {
    final _result = create();
    if (hbs != null) {
      _result.hbs.addAll(hbs);
    }
    return _result;
  }
  factory hbResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory hbResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  hbResponse clone() => hbResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  hbResponse copyWith(void Function(hbResponse) updates) => super.copyWith((message) => updates(message as hbResponse)) as hbResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static hbResponse create() => hbResponse._();
  hbResponse createEmptyInstance() => create();
  static $pb.PbList<hbResponse> createRepeated() => $pb.PbList<hbResponse>();
  @$core.pragma('dart2js:noInline')
  static hbResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<hbResponse>(create);
  static hbResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Homogenbereich> get hbs => $_getList(0);
}

class HomogenbereichServiceApi {
  $pb.RpcClient _client;
  HomogenbereichServiceApi(this._client);

  $async.Future<hbResponse> gethb($pb.ClientContext? ctx, hbRequest request) {
    var emptyResponse = hbResponse();
    return _client.invoke<hbResponse>(ctx, 'HomogenbereichService', 'gethb', request, emptyResponse);
  }
}

