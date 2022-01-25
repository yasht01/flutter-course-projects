import 'package:bloc/bloc.dart';
import 'package:crypto_ticker/data/repos/settings_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsRepo settingsRepo = SettingsRepo();

  //! How to approach this? Initialize settingRepo before.
  SettingsCubit() : super(SettingsInitial(settingsData: {
      "currency": "USD",
      "theme": "Dark"
    }));

  void updateCurrency(String newValue) {
    emit(SettingsUpdating());
    settingsRepo.updateCurrency(newValue);
    emit(SettingUpdated(settingsData: settingsRepo.getSettings()));
  }

  void updateTheme(String newValue) {
    emit(SettingsUpdating());
    settingsRepo.updateTheme(newValue);
    emit(SettingUpdated(settingsData: settingsRepo.getSettings()));
  }
}
