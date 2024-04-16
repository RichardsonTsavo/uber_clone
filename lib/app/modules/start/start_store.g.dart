// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StartStore on _StartStoreBase, Store {
  late final _$indexAtom =
      Atom(name: '_StartStoreBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$_StartStoreBaseActionController =
      ActionController(name: '_StartStoreBase', context: context);

  @override
  void changePage(int value) {
    final _$actionInfo = _$_StartStoreBaseActionController.startAction(
        name: '_StartStoreBase.changePage');
    try {
      return super.changePage(value);
    } finally {
      _$_StartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index}
    ''';
  }
}
