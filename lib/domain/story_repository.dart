import 'package:flutter/material.dart';

import '../utils/asset_png.dart';
import 'story.dart';

class StoryRepository {
  final List<Story> _stories = [
    Story(
      title: "Нам важно ваше мнение! Оцените изменения\nв Simpler",
      image: AssetPNG.buildStoryImagePath(1),
      background: const Color.fromRGBO(153, 210, 255, 1),
      votable: false,
    ),
    Story(
      title: "Включите тёмную тему",
      caption:
          "Занимайтесь английским даже ночью или просто посмотрите как изменится ваш интерфейс!",
      image: AssetPNG.buildStoryImagePath(2),
      background: const Color.fromRGBO(25, 25, 27, 1),
    ),
    Story(
      title: "Соревнуйтесь в рейтинге космонавтов",
      caption:
          "Зарабатывайте очки и продвигайтесь к вершине! Займите место в ракете и изучите новые созвездия",
      image: AssetPNG.buildStoryImagePath(3),
      background: const Color.fromRGBO(255, 155, 4, 1),
    ),
    Story(
      title: "Раскройте преступления и станьте комиссаром",
      caption:
          "Обновлённые детективные истории дают вам новый опыт в расследовании детективных дел",
      image: AssetPNG.buildStoryImagePath(4),
      background: const Color.fromRGBO(248, 81, 83, 1),
    ),
    Story(
      title: "Тренируйте язык с помощью новых заданий",
      caption:
          "Чем больше уроков вы пройдёте, тем больше уникальных заданий станет доступно для тренировки ваших навыков",
      image: AssetPNG.buildStoryImagePath(5),
      background: const Color.fromRGBO(103, 233, 154, 1),
    ),
  ];

  List<Story> get stories => _stories;
}
