// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:project_v/entity/userDTO.dart';

/// This class defines the variables used in the [login_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class LoginModel extends Equatable {
  UserDTO? user;

  LoginModel({this.user});

  LoginModel copyWith({UserDTO? user}) {
    return LoginModel(user: user ?? this.user);
  }

  @override
  List<Object?> get props => [user];
}
