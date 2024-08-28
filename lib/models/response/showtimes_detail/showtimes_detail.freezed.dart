// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'showtimes_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShowtimesDetailResponse _$ShowtimesDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _ShowtimesDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$ShowtimesDetailResponse {
  FilmResponse? get movie => throw _privateConstructorUsedError;
  RoomResponse? get room => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int? get startTime => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowtimesDetailResponseCopyWith<ShowtimesDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowtimesDetailResponseCopyWith<$Res> {
  factory $ShowtimesDetailResponseCopyWith(ShowtimesDetailResponse value,
          $Res Function(ShowtimesDetailResponse) then) =
      _$ShowtimesDetailResponseCopyWithImpl<$Res, ShowtimesDetailResponse>;
  @useResult
  $Res call(
      {FilmResponse? movie,
      RoomResponse? room,
      int? price,
      int? startTime,
      String? id});

  $FilmResponseCopyWith<$Res>? get movie;
  $RoomResponseCopyWith<$Res>? get room;
}

/// @nodoc
class _$ShowtimesDetailResponseCopyWithImpl<$Res,
        $Val extends ShowtimesDetailResponse>
    implements $ShowtimesDetailResponseCopyWith<$Res> {
  _$ShowtimesDetailResponseCopyWithImpl(this._value, this._then);

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
              as FilmResponse?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as RoomResponse?,
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

  @override
  @pragma('vm:prefer-inline')
  $FilmResponseCopyWith<$Res>? get movie {
    if (_value.movie == null) {
      return null;
    }

    return $FilmResponseCopyWith<$Res>(_value.movie!, (value) {
      return _then(_value.copyWith(movie: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomResponseCopyWith<$Res>? get room {
    if (_value.room == null) {
      return null;
    }

    return $RoomResponseCopyWith<$Res>(_value.room!, (value) {
      return _then(_value.copyWith(room: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShowtimesDetailResponseImplCopyWith<$Res>
    implements $ShowtimesDetailResponseCopyWith<$Res> {
  factory _$$ShowtimesDetailResponseImplCopyWith(
          _$ShowtimesDetailResponseImpl value,
          $Res Function(_$ShowtimesDetailResponseImpl) then) =
      __$$ShowtimesDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FilmResponse? movie,
      RoomResponse? room,
      int? price,
      int? startTime,
      String? id});

  @override
  $FilmResponseCopyWith<$Res>? get movie;
  @override
  $RoomResponseCopyWith<$Res>? get room;
}

/// @nodoc
class __$$ShowtimesDetailResponseImplCopyWithImpl<$Res>
    extends _$ShowtimesDetailResponseCopyWithImpl<$Res,
        _$ShowtimesDetailResponseImpl>
    implements _$$ShowtimesDetailResponseImplCopyWith<$Res> {
  __$$ShowtimesDetailResponseImplCopyWithImpl(
      _$ShowtimesDetailResponseImpl _value,
      $Res Function(_$ShowtimesDetailResponseImpl) _then)
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
    return _then(_$ShowtimesDetailResponseImpl(
      movie: freezed == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as FilmResponse?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as RoomResponse?,
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
class _$ShowtimesDetailResponseImpl implements _ShowtimesDetailResponse {
  _$ShowtimesDetailResponseImpl(
      {this.movie, this.room, this.price, this.startTime, this.id});

  factory _$ShowtimesDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShowtimesDetailResponseImplFromJson(json);

  @override
  final FilmResponse? movie;
  @override
  final RoomResponse? room;
  @override
  final int? price;
  @override
  final int? startTime;
  @override
  final String? id;

  @override
  String toString() {
    return 'ShowtimesDetailResponse(movie: $movie, room: $room, price: $price, startTime: $startTime, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowtimesDetailResponseImpl &&
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
  _$$ShowtimesDetailResponseImplCopyWith<_$ShowtimesDetailResponseImpl>
      get copyWith => __$$ShowtimesDetailResponseImplCopyWithImpl<
          _$ShowtimesDetailResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShowtimesDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _ShowtimesDetailResponse implements ShowtimesDetailResponse {
  factory _ShowtimesDetailResponse(
      {final FilmResponse? movie,
      final RoomResponse? room,
      final int? price,
      final int? startTime,
      final String? id}) = _$ShowtimesDetailResponseImpl;

  factory _ShowtimesDetailResponse.fromJson(Map<String, dynamic> json) =
      _$ShowtimesDetailResponseImpl.fromJson;

  @override
  FilmResponse? get movie;
  @override
  RoomResponse? get room;
  @override
  int? get price;
  @override
  int? get startTime;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$ShowtimesDetailResponseImplCopyWith<_$ShowtimesDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
