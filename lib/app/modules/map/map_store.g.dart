// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapStore on _MapStoreBase, Store {
  late final _$containBottomSheetAtom =
      Atom(name: '_MapStoreBase.containBottomSheet', context: context);

  @override
  bool get containBottomSheet {
    _$containBottomSheetAtom.reportRead();
    return super.containBottomSheet;
  }

  @override
  set containBottomSheet(bool value) {
    _$containBottomSheetAtom.reportWrite(value, super.containBottomSheet, () {
      super.containBottomSheet = value;
    });
  }

  late final _$bottomSheetStageAtom =
      Atom(name: '_MapStoreBase.bottomSheetStage', context: context);

  @override
  int get bottomSheetStage {
    _$bottomSheetStageAtom.reportRead();
    return super.bottomSheetStage;
  }

  @override
  set bottomSheetStage(int value) {
    _$bottomSheetStageAtom.reportWrite(value, super.bottomSheetStage, () {
      super.bottomSheetStage = value;
    });
  }

  late final _$currentPolylineAtom =
      Atom(name: '_MapStoreBase.currentPolyline', context: context);

  @override
  Polyline get currentPolyline {
    _$currentPolylineAtom.reportRead();
    return super.currentPolyline;
  }

  @override
  set currentPolyline(Polyline value) {
    _$currentPolylineAtom.reportWrite(value, super.currentPolyline, () {
      super.currentPolyline = value;
    });
  }

  late final _$currentMarkesAtom =
      Atom(name: '_MapStoreBase.currentMarkes', context: context);

  @override
  List<Marker> get currentMarkes {
    _$currentMarkesAtom.reportRead();
    return super.currentMarkes;
  }

  @override
  set currentMarkes(List<Marker> value) {
    _$currentMarkesAtom.reportWrite(value, super.currentMarkes, () {
      super.currentMarkes = value;
    });
  }

  late final _$callScriptAsyncAction =
      AsyncAction('_MapStoreBase.callScript', context: context);

  @override
  Future<dynamic> callScript() {
    return _$callScriptAsyncAction.run(() => super.callScript());
  }

  late final _$_MapStoreBaseActionController =
      ActionController(name: '_MapStoreBase', context: context);

  @override
  void iniData() {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.iniData');
    try {
      return super.iniData();
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBottomSheetStage(int value) {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
        name: '_MapStoreBase.changeBottomSheetStage');
    try {
      return super.changeBottomSheetStage(value);
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
containBottomSheet: ${containBottomSheet},
bottomSheetStage: ${bottomSheetStage},
currentPolyline: ${currentPolyline},
currentMarkes: ${currentMarkes}
    ''';
  }
}
