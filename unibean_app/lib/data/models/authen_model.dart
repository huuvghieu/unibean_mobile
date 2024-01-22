import 'package:equatable/equatable.dart';

class AuthenModel extends Equatable {
  final String jwt;
  final Object user;
  final String role;

  AuthenModel({required this.jwt, required this.user, required this.role});

  @override
  List<Object?> get props => throw UnimplementedError();
}
