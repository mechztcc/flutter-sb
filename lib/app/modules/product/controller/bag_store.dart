import 'package:flutter_sb/app/modules/product/models/product_model.dart';
import 'package:mobx/mobx.dart';

part 'bag_store.g.dart';

class BagStore = _BagStoreBase with _$BagStore;
abstract class _BagStoreBase with Store {

  @observable
  List<ProductModel> products = []; 

  @action
  void addProduct(ProductModel product) {
    products.add(product);
  }
}