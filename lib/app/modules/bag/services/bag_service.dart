import 'package:flutter_sb/app/modules/bag/model/bag_model.dart';
import 'package:flutter_sb/app/modules/bag/repositories/bag_repository.dart';

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
}
