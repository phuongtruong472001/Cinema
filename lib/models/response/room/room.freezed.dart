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

RoomResponse _$RoomResponseFromJson(Map<String, dynamic> json) {
  return _RoomResponse.fromJson(json);
}

/// @nodoc
mixin _$RoomResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  List<List<String?>>? get seats => throw _privateConstructorUsedError;

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
      {String? id, String? name, int? capacity, List<List<String?>>? seats});
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
              as List<List<String?>>?,
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
      {String? id, String? name, int? capacity, List<List<String?>>? seats});
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
    Object? capacity = freezed,
    Object? seats = freezed,
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
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      seats: freezed == seats
          ? _value._seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<List<String?>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomResponseImpl implements _RoomResponse {
  _$RoomResponseImpl(
      {this.id, this.name, this.capacity, final List<List<String?>>? seats})
      : _seats = seats;

  factory _$RoomResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? capacity;
  final List<List<String?>>? _seats;
  @override
  List<List<String?>>? get seats {
    final value = _seats;
    if (value == null) return null;
    if (_seats is EqualUnmodifiableListView) return _seats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RoomResponse(id: $id, name: $name, capacity: $capacity, seats: $seats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomResponseImpl &&
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
      final int? capacity,
      final List<List<String?>>? seats}) = _$RoomResponseImpl;

  factory _RoomResponse.fromJson(Map<String, dynamic> json) =
      _$RoomResponseImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  int? get capacity;
  @override
  List<List<String?>>? get seats;
  @override
  @JsonKey(ignore: true)
  _$$RoomResponseImplCopyWith<_$RoomResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
