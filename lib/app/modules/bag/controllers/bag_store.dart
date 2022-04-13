import 'package:asuka/asuka.dart';
import 'package:flutter_sb/app/modules/bag/model/bag_model.dart';
import 'package:flutter_sb/app/modules/bag/services/bag_service.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'bag_store.g.dart';

class BagStore = _BagStoreBase with _$BagStore;

abstract class _BagStoreBase with Store {
  final BagService bagService;

  _BagStoreBase({required this.bagService});

  Future<bool> create() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      BagModel bag = await bagService.create();
      return true;
    } catch (e) {
      return false;
      print(e);
    }
  }


  Future<BagModel> findBag() async {
    try {
      BagModel bag = await bagService.findBag();
      return bag;
    } catch (e) {
      AsukaSnackbar.alert('Error!').show();
      throw Exception('Error');
    }
  }
}
