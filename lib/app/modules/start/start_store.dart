import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'start_store.g.dart';

class StartStore = _StartStoreBase with _$StartStore;

abstract class _StartStoreBase with Store {
  PageController pageController = PageController();

  @observable
  int index = 0;

  @action
  void changePage(int value) {
    index = value;
    pageController.jumpToPage(
      value,
    );
  }
}
