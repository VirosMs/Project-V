// ignore_for_file: must_be_immutable

part of 'favorite_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// Favorite widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FavoriteEvent extends Equatable {
  /// Returns a list of properties used for equality comparison.
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Favorite widget is first created.
class FavoriteInitialEvent extends FavoriteEvent {
  /// Returns a list of properties used for equality comparison.
  @override
  List<Object?> get props => [];
}
