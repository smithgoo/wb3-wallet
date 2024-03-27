import 'package:get/get.dart';

class HomeState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;

  final _memonicWords = "".obs;
  set memonicWords(value) => _memonicWords.value = value;
  get memonicWords => _memonicWords.value;

  final _address = "".obs;
  set address(value) => _address.value = value;
  get address => _address.value;

  final _privateKey = "".obs;
  set privateKey(value) => _privateKey.value = value;
  get privateKey => _privateKey.value;

  final _gasPrice = "".obs;
  set gasPrice(value) => _gasPrice.value = value;
  get gasPrice => _gasPrice.value;

  final _balance = "".obs;
  set balance(value) => _balance.value = value;
  get balance => _balance.value;
}
