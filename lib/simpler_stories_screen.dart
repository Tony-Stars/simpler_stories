import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/pages_bloc/pages_bloc.dart';
import 'domain/story.dart';
import 'domain/story_repository.dart';
import 'domain/vote_type.dart';
import 'utils/duration_constants.dart';
import 'widgets/story_content.dart';
import 'widgets/story_image.dart';
import 'widgets/time_progress.dart';
import 'widgets/vote_buttons_row.dart';

class SimplerStoriesScreen extends StatefulWidget {
  const SimplerStoriesScreen({super.key});

  @override
  State<SimplerStoriesScreen> createState() => _SimplerStoriesScreenState();
}

class _SimplerStoriesScreenState extends State<SimplerStoriesScreen>
    with SingleTickerProviderStateMixin {
  late final PageController pageController;
  late final AnimationController animationController;
  late final Animatable<Color?> background;

  final List<Story> stories = StoryRepository().stories;

  Timer? timer;

  Future<void> vote(VoteType type) async => await next();

  Future<void> prev() async {
    final bloc = BlocProvider.of<StoriesBloc>(context);
    final page = bloc.state.page;

    if (page <= 0) {
      animationController.stop();
      animationController.reset();
      animationController.forward();
      return;
    }

    // restart last story
    // if (page == stories.length - 1 &&
    //     animationController.status == AnimationStatus.completed) {
    //   animationController.stop();
    //   animationController.reset();

    //   return await changePage(page);
    // }

    animationController.stop();
    animationController.reset();

    await changePage(page - 1);
  }

  Future<void> next() async {
    await animationController.fling();
    animationController.stop();
  }

  Future<void> _exit() => SystemNavigator.pop();

  void onTapUp(final TapUpDetails details) async {
    final width = MediaQuery.of(context).size.width;
    final dx = details.globalPosition.dx;
    if (dx < width / 2) {
      return await prev();
    }

    final bloc = BlocProvider.of<StoriesBloc>(context);
    final page = bloc.state.page;

    if (page < stories.length - 1) {
      return await next();
    }

    _exit();
  }

  void onPageChanged(final int value) async {
    final bloc = BlocProvider.of<StoriesBloc>(context);
    final page = bloc.state.page;
    bloc.add(TransitionEvent(transition: true));
    if (page > value) {
      return await prev();
    }

    return await next();
  }

  Future<void> changePage(final int value) async {
    final bloc = BlocProvider.of<StoriesBloc>(context);

    animationController.stop();

    bloc.add(TransitionEvent(transition: true));

    await pageController.animateToPage(
      value,
      duration: DurationConstants.transition,
      curve: Curves.easeInOut,
    );

    bloc.add(ChangePageEvent(page: value));
    bloc.add(TransitionEvent(transition: false));

    animationController.repeat();
    animationController.forward();
  }

  void init() {
    final colors = <TweenSequenceItem<Color?>>[];
    for (int i = 0; i < stories.length - 1; i++) {
      colors.add(
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: stories[i].background,
            end: stories[i + 1].background,
          ),
        ),
      );
    }

    background = TweenSequence<Color?>(colors);

    pageController = PageController();

    animationController = AnimationController(vsync: this);
    animationController.duration = DurationConstants.page;
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status != AnimationStatus.completed) {
        return;
      }

      final bloc = BlocProvider.of<StoriesBloc>(context);
      final page = bloc.state.page;
      if (page >= stories.length - 1) {
        animationController.stop();
        return;
      }

      changePage(page + 1);
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void reassemble() {
    animationController.dispose();
    pageController.dispose();
    init();
    super.reassemble();
  }

  @override
  void dispose() {
    animationController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoriesBloc, StoriesBlocState>(
      builder: (context, state) {
        return Scaffold(
          body: AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              final position = state.transition
                  ? pageController.hasClients
                      ? pageController.page! / (stories.length - 1)
                      : 0.0
                  : state.page / (stories.length - 1);

              return DecoratedBox(
                decoration: BoxDecoration(
                  color: background.evaluate(AlwaysStoppedAnimation(position)),
                ),
                child: child,
              );
            },
            child: Stack(
              children: [
                StoryImage(
                  visible: !state.transition,
                  image: stories[state.page].image,
                ),
                StoryContent(
                  visible: !state.transition,
                  story: stories[state.page],
                ),
                GestureDetector(
                  onTapUp: !state.transition ? onTapUp : null,
                  onLongPressDown: !state.transition
                      ? (_) => animationController.stop()
                      : null,
                  onLongPressUp: !state.transition
                      ? () => animationController.forward()
                      : null,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: stories.length,
                    onPageChanged: onPageChanged,
                    itemBuilder: (context, index) {
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                TimeProgress(
                  stories: stories,
                  onClose: _exit,
                  animationController: animationController,
                  page: state.page,
                ),
                if (stories[state.page].votable)
                  VoteButtonsRow(
                    visible: !state.transition,
                    vote: vote,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
