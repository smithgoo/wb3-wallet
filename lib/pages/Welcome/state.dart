import 'package:get/get.dart';

class WelcomeState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;

  final _hasBeenSetPwd = false.obs;
  set hasBeenSetPwd(value) => _hasBeenSetPwd.value = value;
  get hasBeenSetPwd => _hasBeenSetPwd.value;
}
