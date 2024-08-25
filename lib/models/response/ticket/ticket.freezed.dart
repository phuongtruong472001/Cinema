// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TicketResponse _$TicketResponseFromJson(Map<String, dynamic> json) {
  return _TicketResponse.fromJson(json);
}

/// @nodoc
mixin _$TicketResponse {
  String? get movie => throw _privateConstructorUsedError;
  String? get room => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int? get startTime => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketResponseCopyWith<TicketResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketResponseCopyWith<$Res> {
  factory $TicketResponseCopyWith(
          TicketResponse value, $Res Function(TicketResponse) then) =
      _$TicketResponseCopyWithImpl<$Res, TicketResponse>;
  @useResult
  $Res call(
      {String? movie, String? room, int? price, int? startTime, String? id});
}

/// @nodoc
class _$TicketResponseCopyWithImpl<$Res, $Val extends TicketResponse>
    implements $TicketResponseCopyWith<$Res> {
  _$TicketResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = freezed,
    Object? room = freezed,
    Object? price = freezed,
    Object? startTime = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      movie: freezed == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as String?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketResponseImplCopyWith<$Res>
    implements $TicketResponseCopyWith<$Res> {
  factory _$$TicketResponseImplCopyWith(_$TicketResponseImpl value,
          $Res Function(_$TicketResponseImpl) then) =
      __$$TicketResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? movie, String? room, int? price, int? startTime, String? id});
}

/// @nodoc
class __$$TicketResponseImplCopyWithImpl<$Res>
    extends _$TicketResponseCopyWithImpl<$Res, _$TicketResponseImpl>
    implements _$$TicketResponseImplCopyWith<$Res> {
  __$$TicketResponseImplCopyWithImpl(
      _$TicketResponseImpl _value, $Res Function(_$TicketResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = freezed,
    Object? room = freezed,
    Object? price = freezed,
    Object? startTime = freezed,
    Object? id = freezed,
  }) {
    return _then(_$TicketResponseImpl(
      movie: freezed == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as String?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketResponseImpl implements _TicketResponse {
  _$TicketResponseImpl(
      {this.movie, this.room, this.price, this.startTime, this.id});

  factory _$TicketResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketResponseImplFromJson(json);

  @override
  final String? movie;
  @override
  final String? room;
  @override
  final int? price;
  @override
  final int? startTime;
  @override
  final String? id;

  @override
  String toString() {
    return 'TicketResponse(movie: $movie, room: $room, price: $price, startTime: $startTime, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketResponseImpl &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, movie, room, price, startTime, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketResponseImplCopyWith<_$TicketResponseImpl> get copyWith =>
      __$$TicketResponseImplCopyWithImpl<_$TicketResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketResponseImplToJson(
      this,
    );
  }
}

abstract class _TicketResponse implements TicketResponse {
  factory _TicketResponse(
      {final String? movie,
      final String? room,
      final int? price,
      final int? startTime,
      final String? id}) = _$TicketResponseImpl;

  factory _TicketResponse.fromJson(Map<String, dynamic> json) =
      _$TicketResponseImpl.fromJson;

  @override
  String? get movie;
  @override
  String? get room;
  @override
  int? get price;
  @override
  int? get startTime;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$TicketResponseImplCopyWith<_$TicketResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
