import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sb/app/modules/product/controller/bag_store.dart';
 
void main() {
  late BagStore store;

  setUpAll(() {
    store = BagStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}