// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GlobalStore on _GlobalStore, Store {
  final _$globalSettingAtom = Atom(name: '_GlobalStore.globalSetting');

  @override
  GlobalSetting get globalSetting {
    _$globalSettingAtom.reportRead();
    return super.globalSetting;
  }

  @override
  set globalSetting(GlobalSetting value) {
    _$globalSettingAtom.reportWrite(value, super.globalSetting, () {
      super.globalSetting = value;
    });
  }

  final _$getGlobalSettingsAsyncAction =
      AsyncAction('_GlobalStore.getGlobalSettings');

  @override
  Future<void> getGlobalSettings() {
    return _$getGlobalSettingsAsyncAction.run(() => super.getGlobalSettings());
  }

  final _$_GlobalStoreActionController = ActionController(name: '_GlobalStore');

  @override
  void setThemeMode(ThemeMode themeMode, BuildContext context) {
    final _$actionInfo = _$_GlobalStoreActionController.startAction(
        name: '_GlobalStore.setThemeMode');
    try {
      return super.setThemeMode(themeMode, context);
    } finally {
      _$_GlobalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
globalSetting: ${globalSetting}
    ''';
  }
}
