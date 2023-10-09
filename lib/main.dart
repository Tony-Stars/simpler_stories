import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/pages_bloc/pages_bloc.dart';
import 'simpler_stories_screen.dart';
import 'theme.dart';
import 'utils/custom_scroll_behavior.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const SimplerStoriesApp());
}

class SimplerStoriesApp extends StatelessWidget {
  const SimplerStoriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simpler stories",
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehavior(),
      theme: theme,
      home: BlocProvider(
        create: (context) => StoriesBloc(),
        child: const SimplerStoriesScreen(),
      ),
    );
  }
}
