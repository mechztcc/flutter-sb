import 'package:flutter_sb/app/modules/bag/services/bag_service.dart';
import 'package:mobx/mobx.dart';

part 'bag_store.g.dart';

class BagStore = _BagStoreBase with _$BagStore;

abstract class _BagStoreBase with Store {
  final BagService bagService;

  _BagStoreBase({required this.bagService});

  Future<void> create(int customer_id) async {
    try {
      await bagService.create(customer_id);
    } catch (e) {
      print(e);
    }
  }
}
