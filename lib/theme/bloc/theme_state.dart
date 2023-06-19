part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({
    this.toggle = false,
  });

  final bool toggle;

  ThemeState copyWith({
    bool? toggle,
  }) {
    return ThemeState(
      toggle: toggle ?? this.toggle,
    );
  }

  @override
  List<Object?> get props => [toggle];
}
