import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ToggleTheme>(_toggleTheme);
  }

  void _toggleTheme(
    ToggleTheme event,
    Emitter<ThemeState> emit,
  ) {
    emit(state.copyWith(toggle: !state.toggle));
  }
}
