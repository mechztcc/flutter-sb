import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sb/app/modules/user/user_store.dart';
 
void main() {
  late UserStore store;

  setUpAll(() {
    store = UserStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}