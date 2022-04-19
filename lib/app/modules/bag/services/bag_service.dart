import 'package:flutter_sb/app/modules/bag/model/bag_model.dart';
import 'package:flutter_sb/app/modules/bag/repositories/bag_repository.dart';
import 'package:flutter_sb/app/modules/product/models/product_model.dart';

class BagService {
  final BagRepository bagRepository;

  BagService({required this.bagRepository});


  Future<BagModel> create() async {
    try {
      BagModel bag = await bagRepository.create();
      return bag;

    } catch (e) {
      throw Exception(e);
    }
  }


  Future<BagModel> findBag() async {
    try {
      BagModel bag = await bagRepository.find();
      return bag;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addItem(ProductModel prod) async {
    try {
      await bagRepository.addItem(prod);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> clearBag() async {
    try {
      await bagRepository.clearBag();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> removeItem(int itemId) async {
    try {
      await bagRepository.removeItem(itemId);
    } catch (e) {
      throw Exception(e);
    }
  }
}
