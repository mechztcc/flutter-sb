import 'package:flutter_sb/app/modules/foodstore/models/foodstore_model.dart';
import 'package:flutter_sb/app/modules/foodstore/repositories/foodstore_repository.dart';

class FoodstoreService {

  final FoodstoreRepository foodstoreRepository;

  FoodstoreService({ required this.foodstoreRepository });

  Future<List<FoodstoreModel>> listAll() async {
    try {
      var foodstores = await foodstoreRepository.listAll();
      return foodstores;
    } catch (e) {
      throw Exception(e);
    }
  }

}