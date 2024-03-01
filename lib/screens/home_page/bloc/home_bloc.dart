import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:project_v/screens/home_page/models/home_model.dart';

part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  /// Initializes the HomeBloc with the given [event] and [emit] function.
  ///
  /// This method is called when a [HomeInitialEvent] is dispatched to the bloc.
  /// It initializes the state of the HomeBloc by copying the current state and setting the [searchController] to a new instance of [TextEditingController].
  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
  }
}
