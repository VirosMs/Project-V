// ignore_for_file: must_be_immutable

part of 'splash_bloc.dart';

/// Represents the state of Splash in the application.
class SplashState extends Equatable {
  /// The object representing the SplashModel.
  final SplashModel? splashModelObj;

  /// Constructs a new instance of [SplashState].
  SplashState({this.splashModelObj});

  @override
  List<Object?> get props => [
        splashModelObj,
      ];

  /// Creates a copy of this [SplashState] with the given parameters overridden.
  ///
  /// If any of the parameters are not provided, the corresponding values from the original [SplashState] will be used.
  SplashState copyWith({SplashModel? splashModelObj}) {
    return SplashState(
      splashModelObj: splashModelObj ?? this.splashModelObj,
    );
  }
}
