import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppLocalizationState {
  final Locale language;
  AppLocalizationState(this.language);
}

class AppLocalizationCubit extends Cubit<AppLocalizationState> {
  final SettingsRepository _settingsRepository;
  AppLocalizationCubit(this._settingsRepository)
      : super(AppLocalizationState(UiUtils.getLocaleFromLanguageCode(
            _settingsRepository.getCurrentLanguageCode())));

  void changeLanguage(String languageCode) {
    _settingsRepository.setCurrentLanguageCode(languageCode);
    emit(AppLocalizationState(UiUtils.getLocaleFromLanguageCode(languageCode)));
  }
}
