class SettingsRepo {
  String currency;
  String theme;

  SettingsRepo({this.currency = "USD", this.theme = "Dark"});

  void updateCurrency(String newValue) {
    currency = newValue;
  }

  Map<String, String> getSettings() {
    return {
      "currency": currency,
      "theme": theme
    };
  }

  void updateTheme(String newValue) {
    theme = newValue;
  }
}
