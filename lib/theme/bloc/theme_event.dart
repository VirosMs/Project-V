part of 'theme_bloc.dart';

/// The base class for all theme events.
@immutable
abstract class ThemeEvent extends Equatable {}

/// An event that represents a change in the theme.
class ThemeChangeEvent extends ThemeEvent {
  /// Creates a [ThemeChangeEvent] with the specified [themeType].
  ///
  /// The [themeType] parameter is required and represents the new theme type.
  /// It is used to update the theme data using [PrefUtils().setThemeData()].
  ThemeChangeEvent({required this.themeType}) : super() {
    PrefUtils().setThemeData(themeType);
  }

  /// The new theme type.
  final String themeType;

  @override
  List<Object?> get props => [];
}
