part of 'settings_cubit.dart';

abstract class SettingsState {
  Map<String, String>? settingsData;
}

class SettingsInitial extends SettingsState {
  Map<String, String>? settingsData;

  SettingsInitial({this.settingsData});
}

class SettingsUpdating extends SettingsState {}

class SettingUpdated extends SettingsState {
  Map<String, String>? settingsData;

  SettingUpdated({this.settingsData});
}
