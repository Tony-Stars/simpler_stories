part of "pages_bloc.dart";

class StoriesBlocState {
  final int page;
  final bool transition;

  StoriesBlocState({
    required this.page,
    required this.transition,
  });

  factory StoriesBlocState.init() {
    return StoriesBlocState(
      page: 0,
      transition: false,
    );
  }

  StoriesBlocState copyWith({int? page, bool? transition}) {
    return StoriesBlocState(
      page: page ?? this.page,
      transition: transition ?? this.transition,
    );
  }
}
