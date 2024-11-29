part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  final int selectedIndex;
  const NavigationState({required this.selectedIndex});

  factory NavigationState.initial() => const NavigationState(selectedIndex: 0);

  NavigationState copyWith({int? selectedIndex}) {
    return NavigationState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }

  @override
  List<Object?> get props => [selectedIndex];
}
