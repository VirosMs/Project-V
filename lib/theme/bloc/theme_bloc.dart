import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

part 'theme_event.dart';
part 'theme_state.dart';

/// The [ThemeBloc] class is responsible for managing the theme state of the application.
/// It extends the [Bloc] class from the `flutter_bloc` package.
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  /// Constructs a [ThemeBloc] instance with the given [initialState].
  /// It also registers the [ThemeChangeEvent] event handler.
  ThemeBloc(ThemeState initialState) : super(initialState) {
    on<ThemeChangeEvent>(_changeTheme);
  }

  /// Handles the [ThemeChangeEvent] by updating the theme type in the state.
  /// It emits a new [ThemeState] with the updated theme type.
  _changeTheme(
    ThemeChangeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    emit(state.copyWith(themeType: event.themeType));
  }
}
