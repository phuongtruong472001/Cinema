// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'showtimes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomResponse _$RoomResponseFromJson(Map<String, dynamic> json) {
  return _RoomResponse.fromJson(json);
}

/// @nodoc
mixin _$RoomResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomResponseCopyWith<RoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomResponseCopyWith<$Res> {
  factory $RoomResponseCopyWith(
          RoomResponse value, $Res Function(RoomResponse) then) =
      _$RoomResponseCopyWithImpl<$Res, RoomResponse>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      int? duration,
      String? description,
      String? thumbnail,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$RoomResponseCopyWithImpl<$Res, $Val extends RoomResponse>
    implements $RoomResponseCopyWith<$Res> {
  _$RoomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = freezed,
    Object? description = freezed,
    Object? thumbnail = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomResponseImplCopyWith<$Res>
    implements $RoomResponseCopyWith<$Res> {
  factory _$$RoomResponseImplCopyWith(
          _$RoomResponseImpl value, $Res Function(_$RoomResponseImpl) then) =
      __$$RoomResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      int? duration,
      String? description,
      String? thumbnail,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$RoomResponseImplCopyWithImpl<$Res>
    extends _$RoomResponseCopyWithImpl<$Res, _$RoomResponseImpl>
    implements _$$RoomResponseImplCopyWith<$Res> {
  __$$RoomResponseImplCopyWithImpl(
      _$RoomResponseImpl _value, $Res Function(_$RoomResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = freezed,
    Object? description = freezed,
    Object? thumbnail = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$RoomResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomResponseImpl implements _RoomResponse {
  _$RoomResponseImpl(
      {this.id,
      this.name,
      this.duration,
      this.description,
      this.thumbnail,
      this.createdAt,
      this.updatedAt});

  factory _$RoomResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? duration;
  @override
  final String? description;
  @override
  final String? thumbnail;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'RoomResponse(id: $id, name: $name, duration: $duration, description: $description, thumbnail: $thumbnail, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, duration, description,
      thumbnail, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomResponseImplCopyWith<_$RoomResponseImpl> get copyWith =>
      __$$RoomResponseImplCopyWithImpl<_$RoomResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomResponseImplToJson(
      this,
    );
  }
}

abstract class _RoomResponse implements RoomResponse {
  factory _RoomResponse(
      {final String? id,
      final String? name,
      final int? duration,
      final String? description,
      final String? thumbnail,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$RoomResponseImpl;

  factory _RoomResponse.fromJson(Map<String, dynamic> json) =
      _$RoomResponseImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  int? get duration;
  @override
  String? get description;
  @override
  String? get thumbnail;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$RoomResponseImplCopyWith<_$RoomResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
