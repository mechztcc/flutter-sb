import 'package:flutter_sb/app/modules/bag/repositories/bag_repository.dart';

class BagService {
  final BagRepository bagRepository;

  BagService({required this.bagRepository});


  Future<void> create(int customer_id) async {
    try {
      await bagRepository.create(customer_id);

    } catch (e) {
      throw Exception(e);
    }
  }
}
