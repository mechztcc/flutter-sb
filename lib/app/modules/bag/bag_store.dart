import 'package:mobx/mobx.dart';

part 'bag_store.g.dart';

class BagStore = _BagStoreBase with _$BagStore;
abstract class _BagStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}