// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel extends Equatable {
  HomeModel();

  /// Creates a copy of this [HomeModel] instance.
  HomeModel copyWith() {
    return HomeModel();
  }

  @override
  List<Object?> get props => [];

  
}
