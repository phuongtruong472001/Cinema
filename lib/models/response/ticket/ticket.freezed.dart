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
  ShowtimesDetailResponse? get showtime => throw _privateConstructorUsedError;
  int? get startTime => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get seat => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;

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
      {ShowtimesDetailResponse? showtime,
      int? startTime,
      String? id,
      String? seat,
      String? user});

  $ShowtimesDetailResponseCopyWith<$Res>? get showtime;
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
    Object? showtime = freezed,
    Object? startTime = freezed,
    Object? id = freezed,
    Object? seat = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      showtime: freezed == showtime
          ? _value.showtime
          : showtime // ignore: cast_nullable_to_non_nullable
              as ShowtimesDetailResponse?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      seat: freezed == seat
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShowtimesDetailResponseCopyWith<$Res>? get showtime {
    if (_value.showtime == null) {
      return null;
    }

    return $ShowtimesDetailResponseCopyWith<$Res>(_value.showtime!, (value) {
      return _then(_value.copyWith(showtime: value) as $Val);
    });
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
      {ShowtimesDetailResponse? showtime,
      int? startTime,
      String? id,
      String? seat,
      String? user});

  @override
  $ShowtimesDetailResponseCopyWith<$Res>? get showtime;
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
    Object? showtime = freezed,
    Object? startTime = freezed,
    Object? id = freezed,
    Object? seat = freezed,
    Object? user = freezed,
  }) {
    return _then(_$TicketResponseImpl(
      showtime: freezed == showtime
          ? _value.showtime
          : showtime // ignore: cast_nullable_to_non_nullable
              as ShowtimesDetailResponse?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      seat: freezed == seat
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketResponseImpl implements _TicketResponse {
  _$TicketResponseImpl(
      {this.showtime, this.startTime, this.id, this.seat, this.user});

  factory _$TicketResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketResponseImplFromJson(json);

  @override
  final ShowtimesDetailResponse? showtime;
  @override
  final int? startTime;
  @override
  final String? id;
  @override
  final String? seat;
  @override
  final String? user;

  @override
  String toString() {
    return 'TicketResponse(showtime: $showtime, startTime: $startTime, id: $id, seat: $seat, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketResponseImpl &&
            (identical(other.showtime, showtime) ||
                other.showtime == showtime) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.seat, seat) || other.seat == seat) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, showtime, startTime, id, seat, user);

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
      {final ShowtimesDetailResponse? showtime,
      final int? startTime,
      final String? id,
      final String? seat,
      final String? user}) = _$TicketResponseImpl;

  factory _TicketResponse.fromJson(Map<String, dynamic> json) =
      _$TicketResponseImpl.fromJson;

  @override
  ShowtimesDetailResponse? get showtime;
  @override
  int? get startTime;
  @override
  String? get id;
  @override
  String? get seat;
  @override
  String? get user;
  @override
  @JsonKey(ignore: true)
  _$$TicketResponseImplCopyWith<_$TicketResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
