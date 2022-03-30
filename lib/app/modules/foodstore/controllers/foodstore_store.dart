import 'package:flutter_sb/app/modules/foodstore/models/foodstore_model.dart';
import 'package:flutter_sb/app/modules/foodstore/services/foodstore_service.dart';
import 'package:mobx/mobx.dart';

part 'foodstore_store.g.dart';

class FoodstoreStore = _FoodstoreStoreBase with _$FoodstoreStore;
abstract class _FoodstoreStoreBase with Store {

  final FoodstoreService foodstoreService;

  _FoodstoreStoreBase({ required this.foodstoreService});

  List<FoodstoreModel> foodstores = [];

  Future<List<FoodstoreModel>> listAll() async {
    try {
      foodstores = await foodstoreService.listAll();
      return foodstores;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<FoodstoreModel>> getList() async {
    try {
      await listAll();
      return foodstores;
    } catch (e) {
      print(e);
      return [];
    }
  }

}