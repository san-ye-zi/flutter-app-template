import 'package:flutter/material.dart' show BuildContext, FlutterError;

import 'app_localizations.dart' show AppLocalizations;

extension BuildContextLocalization on BuildContext {
  AppLocalizations get l10n {
    final localizations = AppLocalizations.of(this);
    if (localizations == null) {
      throw FlutterError('AppLocalizations not found in context');
    }
    return localizations;
  }

  AppLocalizations? get l10nOrNull => AppLocalizations.of(this);
}
