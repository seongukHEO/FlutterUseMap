import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo.freezed.dart';

part 'memo.g.dart';

@freezed
sealed class Memo with _$Memo{
  factory Memo({
    String? title,
    String? content,
    String? date,
    int? timeStamp,
    String? imgUrl
}) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);

}