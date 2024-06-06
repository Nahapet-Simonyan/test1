// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `{moodType, select, joy {Joy} fear {Fear} rabies {Rabies} sadness {Sadness} calmness {Calmness} force{Force}}`
  String moodType(Object moodType) {
    return Intl.select(
      moodType,
      {
        'joy': 'Joy',
        'fear': 'Fear',
        'rabies': 'Rabies',
        'sadness': 'Sadness',
        'calmness': 'Calmness',
        'force': 'Force',
      },
      name: 'moodType',
      desc: '',
      args: [moodType],
    );
  }

  /// `What do you feel?`
  String get whatDoYouFeel {
    return Intl.message(
      'What do you feel?',
      name: 'whatDoYouFeel',
      desc: '',
      args: [],
    );
  }

  /// `Уровень стресса`
  String get stressLevel {
    return Intl.message(
      'Уровень стресса',
      name: 'stressLevel',
      desc: '',
      args: [],
    );
  }

  /// `Самооценка`
  String get selfRespect {
    return Intl.message(
      'Самооценка',
      name: 'selfRespect',
      desc: '',
      args: [],
    );
  }

  /// `Заметки`
  String get notes {
    return Intl.message(
      'Заметки',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Сегодня я чувствую себя хорошо|`
  String get moodSurveyNoteHintText {
    return Intl.message(
      'Сегодня я чувствую себя хорошо|',
      name: 'moodSurveyNoteHintText',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message(
      'Сохранить',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Сегодня`
  String get today {
    return Intl.message(
      'Сегодня',
      name: 'today',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
