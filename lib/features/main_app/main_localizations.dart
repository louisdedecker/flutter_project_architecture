import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainLocalizations {
  final Map<String, dynamic> localizations;

  const MainLocalizations({@required this.localizations})
      : assert(localizations != null);

  static MainLocalizations of(BuildContext context) {
    return Localizations.of<MainLocalizations>(context, MainLocalizations);
  }

  String localize(String key) {
    if (localizations.containsKey(key)) {
      return localizations[key];
    } else {
      return key;
    }
  }
}

class MainLocalizationsDelegate
    extends LocalizationsDelegate<MainLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<MainLocalizations> load(Locale locale) async {
    var fileName = '${locale.languageCode}.json';
    try {
      var jsonString = await rootBundle.loadString('assets/strings/$fileName');
      var json = await jsonDecode(jsonString);
      return MainLocalizations(localizations: json);
    } catch (ex) {
      throw Exception('error loading assets/strings/$fileName');
    }
  }

  @override
  bool shouldReload(MainLocalizationsDelegate old) => false;
}
