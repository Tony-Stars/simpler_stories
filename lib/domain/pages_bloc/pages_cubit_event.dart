part of "pages_bloc.dart";

abstract class StoriesBlocEvent {}

class ChangePageEvent extends StoriesBlocEvent {
  final int page;

  ChangePageEvent({required this.page});
}

class TransitionEvent extends StoriesBlocEvent {
  final bool transition;

  TransitionEvent({required this.transition});
}
