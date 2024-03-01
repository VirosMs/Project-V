// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// Register widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Register widget is first created.
class RegisterInitialEvent extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

/// Event for changing password visibility.
///
/// This event is dispatched when the user toggles the visibility of the password field.
class ChangePasswordVisibilityEvent extends RegisterEvent {
  /// The new value of the password visibility.
  final bool value;

  /// Creates a [ChangePasswordVisibilityEvent] with the given [value].
  ChangePasswordVisibilityEvent({required this.value});

  @override
  List<Object?> get props => [value];
}

/// Event for changing password visibility.
///
/// This event is dispatched when the user toggles the visibility of the password field.
class ChangePasswordVisibilityEvent1 extends RegisterEvent {
  /// The new value of the password visibility.
  final bool value;

  /// Creates a [ChangePasswordVisibilityEvent1] with the given [value].
  ChangePasswordVisibilityEvent1({required this.value});

  @override
  List<Object?> get props => [value];
}

/// Event for changing checkbox.
///
/// This event is dispatched when the user toggles the checkbox.
class ChangeCheckBoxEvent extends RegisterEvent {
  /// The new value of the checkbox.
  final bool value;

  /// Creates a [ChangeCheckBoxEvent] with the given [value].
  ChangeCheckBoxEvent({required this.value});

  @override
  List<Object?> get props => [value];
}

/// Event for register button press.
///
/// This event is dispatched when the user presses the register button.
class RegisterButtonPressEvent extends RegisterEvent {
  /// The register model object containing the user's registration data.
  final RegisterModel registerModelObj;

  /// Creates a [RegisterButtonPressEvent] with the given [registerModelObj].
  RegisterButtonPressEvent({required this.registerModelObj});

  @override
  List<Object?> get props => [registerModelObj];
}
