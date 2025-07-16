import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  final String token;

  const LoginResponseModel({required this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'],
    );
  }

  @override
  List<Object?> get props => [token];
}
