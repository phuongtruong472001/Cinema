// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShowtimesResponse _$ShowtimesResponseFromJson(Map<String, dynamic> json) {
  return _ShowtimesResponse.fromJson(json);
}

/// @nodoc
mixin _$ShowtimesResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  List<List<String>>? get seats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowtimesResponseCopyWith<ShowtimesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowtimesResponseCopyWith<$Res> {
  factory $ShowtimesResponseCopyWith(
          ShowtimesResponse value, $Res Function(ShowtimesResponse) then) =
      _$ShowtimesResponseCopyWithImpl<$Res, ShowtimesResponse>;
  @useResult
  $Res call(
      {String? id, String? name, int? capacity, List<List<String>>? seats});
}

/// @nodoc
class _$ShowtimesResponseCopyWithImpl<$Res, $Val extends ShowtimesResponse>
    implements $ShowtimesResponseCopyWith<$Res> {
  _$ShowtimesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? capacity = freezed,
    Object? seats = freezed,
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
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      seats: freezed == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<List<String>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShowtimesResponseImplCopyWith<$Res>
    implements $ShowtimesResponseCopyWith<$Res> {
  factory _$$ShowtimesResponseImplCopyWith(_$ShowtimesResponseImpl value,
          $Res Function(_$ShowtimesResponseImpl) then) =
      __$$ShowtimesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, String? name, int? capacity, List<List<String>>? seats});
}

/// @nodoc
class __$$ShowtimesResponseImplCopyWithImpl<$Res>
    extends _$ShowtimesResponseCopyWithImpl<$Res, _$ShowtimesResponseImpl>
    implements _$$ShowtimesResponseImplCopyWith<$Res> {
  __$$ShowtimesResponseImplCopyWithImpl(_$ShowtimesResponseImpl _value,
      $Res Function(_$ShowtimesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? capacity = freezed,
    Object? seats = freezed,
  }) {
    return _then(_$ShowtimesResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      seats: freezed == seats
          ? _value._seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<List<String>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShowtimesResponseImpl implements _ShowtimesResponse {
  _$ShowtimesResponseImpl(
      {this.id, this.name, this.capacity, final List<List<String>>? seats})
      : _seats = seats;

  factory _$ShowtimesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShowtimesResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? capacity;
  final List<List<String>>? _seats;
  @override
  List<List<String>>? get seats {
    final value = _seats;
    if (value == null) return null;
    if (_seats is EqualUnmodifiableListView) return _seats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ShowtimesResponse(id: $id, name: $name, capacity: $capacity, seats: $seats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowtimesResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            const DeepCollectionEquality().equals(other._seats, _seats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, capacity,
      const DeepCollectionEquality().hash(_seats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowtimesResponseImplCopyWith<_$ShowtimesResponseImpl> get copyWith =>
      __$$ShowtimesResponseImplCopyWithImpl<_$ShowtimesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShowtimesResponseImplToJson(
      this,
    );
  }
}

abstract class _ShowtimesResponse implements ShowtimesResponse {
  factory _ShowtimesResponse(
      {final String? id,
      final String? name,
      final int? capacity,
      final List<List<String>>? seats}) = _$ShowtimesResponseImpl;

  factory _ShowtimesResponse.fromJson(Map<String, dynamic> json) =
      _$ShowtimesResponseImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  int? get capacity;
  @override
  List<List<String>>? get seats;
  @override
  @JsonKey(ignore: true)
  _$$ShowtimesResponseImplCopyWith<_$ShowtimesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
