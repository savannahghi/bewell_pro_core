// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PageInfo _$$_PageInfoFromJson(Map<String, dynamic> json) => _$_PageInfo(
      hasNextPage: json['hasNextPage'] as bool?,
      hasPreviousPage: json['hasPreviousPage'] as bool?,
      startCursor: json['startCursor'] as String?,
      endCursor: json['endCursor'] as String?,
    );

Map<String, dynamic> _$$_PageInfoToJson(_$_PageInfo instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
      'startCursor': instance.startCursor,
      'endCursor': instance.endCursor,
    };
