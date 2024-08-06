// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoImpl _$$MemoImplFromJson(Map<String, dynamic> json) => _$MemoImpl(
      userUid: json['userUid'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      date: json['date'] as String?,
      timeStamp: (json['timeStamp'] as num?)?.toInt(),
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MemoImplToJson(_$MemoImpl instance) =>
    <String, dynamic>{
      'userUid': instance.userUid,
      'title': instance.title,
      'content': instance.content,
      'date': instance.date,
      'timeStamp': instance.timeStamp,
      'lat': instance.lat,
      'lng': instance.lng,
    };
