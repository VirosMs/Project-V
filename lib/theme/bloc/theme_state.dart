part of 'theme_bloc.dart';

/// Represents the state of the theme in the application.
@immutable
class ThemeState extends Equatable {
  /// The type of the theme.
  final String themeType;

  /// Constructs a [ThemeState] with the given [themeType].
  ThemeState({required this.themeType});

  @override
  List<Object?> get props => [themeType];

  /// Creates a new [ThemeState] instance with the provided [themeType].
  ThemeState copyWith({String? themeType}) {
    return ThemeState(themeType: themeType ?? this.themeType);
  }
}
