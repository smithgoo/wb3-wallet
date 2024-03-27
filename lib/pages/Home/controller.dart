import 'package:get/get.dart';
import 'package:web3_wallet/WalletManager.dart';
import 'package:web3_wallet/common/utils/utils.dart';

import 'index.dart';

class HomeController extends GetxController {
  HomeController();

  final state = HomeState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  btnClickWithType(type) async {
    Loading.show();
    switch (type) {
      case 1:
        // do something
        try {
          state.memonicWords = WalletManager.createMemonicWord();
        } catch (e) {
          Loading.dismiss();
        }
        Loading.dismiss();
        break;
      case 2:
        try {
          List x =
              WalletManager.createWalletFromMemonicWord(state.memonicWords);
          state.address = x[0];
          state.privateKey = x[1];
        } catch (e) {
          Loading.dismiss();
        }
        Loading.dismiss();
        // do something
        break;
      case 3:
        try {
          List x = WalletManager.createWalletFromPrivateKey(state.privateKey);
          state.address = x[0];
          state.privateKey = x[1];
        } catch (e) {
          Loading.dismiss();
        }
        Loading.dismiss();
        // do something
        break;
      case 4:
        try {
          state.gasPrice = await WalletManager.getGasPrice();
        } catch (e) {
          Loading.dismiss();
        }
        Loading.dismiss();
        // do something
        break;
      case 5:
        try {
          state.balance = await WalletManager.getBalance(state.address);
        } catch (e) {
          Loading.dismiss();
        }
        Loading.dismiss();
        // do something
        break;
      case 6:
        try {
          state.balance = await WalletManager.sendTransaction(
              state.address, state.address, "100000000");
        } catch (e) {
          Loading.dismiss();
        }
        Loading.dismiss();
        // do something
        break;
      default:
        break;
    }
  }
}
