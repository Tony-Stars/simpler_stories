import 'package:flutter_bloc/flutter_bloc.dart';

import '../story.dart';
import '../story_repository.dart';

part 'pages_cubit_event.dart';
part 'pages_cubit_state.dart';

class StoriesBloc extends Bloc<StoriesBlocEvent, StoriesBlocState> {
  final List<Story> stories = StoryRepository().stories;

  StoriesBloc() : super(StoriesBlocState.init()) {
    on<ChangePageEvent>(_setPage);
    on<TransitionEvent>(_setTransition);
  }

  void _setPage(
    final ChangePageEvent event,
    final Emitter<StoriesBlocState> emit,
  ) {
    final page = event.page;
    if (page >= stories.length || page < 0) {
      return;
    }

    emit(state.copyWith(page: page));
  }

  void _setTransition(
    final TransitionEvent event,
    final Emitter<StoriesBlocState> emit,
  ) {
    emit(state.copyWith(transition: event.transition));
  }
}
