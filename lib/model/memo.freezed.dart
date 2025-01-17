// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Memo _$MemoFromJson(Map<String, dynamic> json) {
  return _Memo.fromJson(json);
}

/// @nodoc
mixin _$Memo {
  String? get userUid => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  int? get timeStamp => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoCopyWith<Memo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoCopyWith<$Res> {
  factory $MemoCopyWith(Memo value, $Res Function(Memo) then) =
      _$MemoCopyWithImpl<$Res, Memo>;
  @useResult
  $Res call(
      {String? userUid,
      String? title,
      String? content,
      String? date,
      int? timeStamp,
      double? lat,
      double? lng});
}

/// @nodoc
class _$MemoCopyWithImpl<$Res, $Val extends Memo>
    implements $MemoCopyWith<$Res> {
  _$MemoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? date = freezed,
    Object? timeStamp = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      userUid: freezed == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoImplCopyWith<$Res> implements $MemoCopyWith<$Res> {
  factory _$$MemoImplCopyWith(
          _$MemoImpl value, $Res Function(_$MemoImpl) then) =
      __$$MemoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userUid,
      String? title,
      String? content,
      String? date,
      int? timeStamp,
      double? lat,
      double? lng});
}

/// @nodoc
class __$$MemoImplCopyWithImpl<$Res>
    extends _$MemoCopyWithImpl<$Res, _$MemoImpl>
    implements _$$MemoImplCopyWith<$Res> {
  __$$MemoImplCopyWithImpl(_$MemoImpl _value, $Res Function(_$MemoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? date = freezed,
    Object? timeStamp = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_$MemoImpl(
      userUid: freezed == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemoImpl implements _Memo {
  _$MemoImpl(
      {this.userUid,
      this.title,
      this.content,
      this.date,
      this.timeStamp,
      this.lat,
      this.lng});

  factory _$MemoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoImplFromJson(json);

  @override
  final String? userUid;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? date;
  @override
  final int? timeStamp;
  @override
  final double? lat;
  @override
  final double? lng;

  @override
  String toString() {
    return 'Memo(userUid: $userUid, title: $title, content: $content, date: $date, timeStamp: $timeStamp, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoImpl &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userUid, title, content, date, timeStamp, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoImplCopyWith<_$MemoImpl> get copyWith =>
      __$$MemoImplCopyWithImpl<_$MemoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoImplToJson(
      this,
    );
  }
}

abstract class _Memo implements Memo {
  factory _Memo(
      {final String? userUid,
      final String? title,
      final String? content,
      final String? date,
      final int? timeStamp,
      final double? lat,
      final double? lng}) = _$MemoImpl;

  factory _Memo.fromJson(Map<String, dynamic> json) = _$MemoImpl.fromJson;

  @override
  String? get userUid;
  @override
  String? get title;
  @override
  String? get content;
  @override
  String? get date;
  @override
  int? get timeStamp;
  @override
  double? get lat;
  @override
  double? get lng;
  @override
  @JsonKey(ignore: true)
  _$$MemoImplCopyWith<_$MemoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
