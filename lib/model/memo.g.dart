// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoImpl _$$MemoImplFromJson(Map<String, dynamic> json) => _$MemoImpl(
      title: json['title'] as String?,
      content: json['content'] as String?,
      date: json['date'] as String?,
      timeStamp: (json['timeStamp'] as num?)?.toInt(),
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$$MemoImplToJson(_$MemoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'date': instance.date,
      'timeStamp': instance.timeStamp,
      'imgUrl': instance.imgUrl,
    };
