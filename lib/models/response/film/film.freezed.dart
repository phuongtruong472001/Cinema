// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'film.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FilmResponse _$FilmResponseFromJson(Map<String, dynamic> json) {
  return _FilmResponse.fromJson(json);
}

/// @nodoc
mixin _$FilmResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilmResponseCopyWith<FilmResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilmResponseCopyWith<$Res> {
  factory $FilmResponseCopyWith(
          FilmResponse value, $Res Function(FilmResponse) then) =
      _$FilmResponseCopyWithImpl<$Res, FilmResponse>;
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
class _$FilmResponseCopyWithImpl<$Res, $Val extends FilmResponse>
    implements $FilmResponseCopyWith<$Res> {
  _$FilmResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$FilmResponseImplCopyWith<$Res>
    implements $FilmResponseCopyWith<$Res> {
  factory _$$FilmResponseImplCopyWith(
          _$FilmResponseImpl value, $Res Function(_$FilmResponseImpl) then) =
      __$$FilmResponseImplCopyWithImpl<$Res>;
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
class __$$FilmResponseImplCopyWithImpl<$Res>
    extends _$FilmResponseCopyWithImpl<$Res, _$FilmResponseImpl>
    implements _$$FilmResponseImplCopyWith<$Res> {
  __$$FilmResponseImplCopyWithImpl(
      _$FilmResponseImpl _value, $Res Function(_$FilmResponseImpl) _then)
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
    return _then(_$FilmResponseImpl(
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
class _$FilmResponseImpl implements _FilmResponse {
  _$FilmResponseImpl(
      {this.id,
      this.name,
      this.duration,
      this.description,
      this.thumbnail,
      this.createdAt,
      this.updatedAt});

  factory _$FilmResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilmResponseImplFromJson(json);

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
    return 'FilmResponse(id: $id, name: $name, duration: $duration, description: $description, thumbnail: $thumbnail, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilmResponseImpl &&
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
  _$$FilmResponseImplCopyWith<_$FilmResponseImpl> get copyWith =>
      __$$FilmResponseImplCopyWithImpl<_$FilmResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilmResponseImplToJson(
      this,
    );
  }
}

abstract class _FilmResponse implements FilmResponse {
  factory _FilmResponse(
      {final String? id,
      final String? name,
      final int? duration,
      final String? description,
      final String? thumbnail,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$FilmResponseImpl;

  factory _FilmResponse.fromJson(Map<String, dynamic> json) =
      _$FilmResponseImpl.fromJson;

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
  _$$FilmResponseImplCopyWith<_$FilmResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
