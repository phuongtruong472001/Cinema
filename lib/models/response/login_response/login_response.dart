import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class LoginResponse<T> {
  final String? name;
  final String? email;
  final int? status;
  final int? role;

  final String? accessToken;

  LoginResponse({
    this.name,
    this.email,
    this.status,
    this.role,
    this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$LoginResponseFromJson(json, fromJsonT);
}
