import 'package:test1/core/enums/enums.dart';

class MoodSubtypes {
  final MoodType moodType;

  MoodSubtypes({required this.moodType});

  static List<String> getList(MoodType moodType) {
    return switch (moodType) {
      MoodType.joy => joy,
      MoodType.fear => fear,
      MoodType.rabies => rabies,
      MoodType.sadness => sadness,
      MoodType.calmness => calmness,
      MoodType.force => force,
    };
  }

  static final List<String> joy = [
    'Возбуждение',
    'Восторг',
    'Игривость',
    'Наслаждение',
    'Очарование',
    'Осознанность',
    'Смелость',
    'Удовольствие',
    'Чувственность',
    'Энергичность',
    'Экстравагантность',
  ];
  static final List<String> fear = [
    'Страх1',
    'Страх2',
    'Страх3',
    'Страх4',
    'Страх5',
    'Страх6',
    'Страх7',
    'Страх8',
    'Страх9',
    'Страх10',
    'Страх11',
  ];
  static final List<String> rabies = [
    'Бешенство1',
    'Бешенство2',
    'Бешенство3',
    'Бешенство4',
    'Бешенство5',
    'Бешенство6',
    'Бешенство7',
    'Бешенство8',
    'Бешенство9',
    'Бешенство10',
    'Бешенство11',
  ];
  static final List<String> sadness = [
    'Грусть1',
    'Грусть2',
    'Грусть3',
    'Грусть4',
    'Грусть5',
    'Грусть6',
    'Грусть7',
    'Грусть8',
    'Грусть9',
    'Грусть10',
    'Грусть11',
  ];
  static final List<String> calmness = [
    'Спокойствие1',
    'Спокойствие2',
    'Спокойствие3',
    'Спокойствие4',
    'Спокойствие5',
    'Спокойствие6',
    'Спокойствие7',
    'Спокойствие8',
    'Спокойствие9',
    'Спокойствие10',
    'Спокойствие11',
  ];
  static final List<String> force = [
    'Сила1',
    'Сила2',
    'Сила3',
    'Сила4',
    'Сила5',
    'Сила6',
    'Сила7',
    'Сила8',
    'Сила9',
    'Сила10',
    'Сила11',
  ];

}
