// ignore: file_names
import 'package:ether_dart/ether_dart.dart';
import 'package:web3_wallet/common/widgets/widgets.dart'; // 导入 http 包

class WalletManager {
  static const starknetNet =
      "https://mainnet.infura.io/v3/3e956d2601264ce78cd5be274128c04f";
  // static const starknetNet =
  //     "https://starknet-alpha.infura.io/v3/3e956d2601264ce78cd5be274128c04f";
  //生成助记词
  static createMemonicWord() {
    final etherDart = EtherDart();

    ///Generate memomic phrase (can be called seed phrase (Eg : cow ram pig goat ))
    final memonicPhrase = etherDart.generateMemonicPhrase();
    if (memonicPhrase != null) {
      print(memonicPhrase);
      return memonicPhrase;
    } else {
      toastInfo(msg: "Failed to generate memonic phrase");
    }
  }

  //导入助记词 生成钱包
  static createWalletFromMemonicWord(String memonicPhrase) {
    final etherDart = EtherDart();

    ///Create Wallet from private key
    final wallet = etherDart.walletFromMemonicPhrase(memonicPhrase);

    ///Create wallet from private key (NOTE: Wallet from private doesnt contain memonic seed phrase)
    final walletFromPrivateKey =
        etherDart.walletFromPrivateKey(wallet!.privateKey!.toString());
    return [walletFromPrivateKey?.address, walletFromPrivateKey?.privateKey];
  }

  //导入私钥 生成钱包
  static createWalletFromPrivateKey(String privateKey) {
    final etherDart = EtherDart();

    ///Create Wallet from private key
    final wallet = etherDart.walletFromPrivateKey(privateKey);
    final walletFromPrivateKey =
        etherDart.walletFromPrivateKey(wallet!.privateKey!.toString());
    return [walletFromPrivateKey?.address, walletFromPrivateKey?.privateKey];
  }

  //获取地址上的余额
  static getBalance(String addresst) async {
    const myHost = starknetNet;
    var httpClient = Client();
    var ethClient = Web3Client(myHost, httpClient);
    var credentials = EthPrivateKey.fromHex(addresst);
    var address = credentials.address;
    EtherAmount balance = await ethClient.getBalance(address);
    print(balance.getValueInUnit(EtherUnit.ether));
    return balance.getValueInUnit(EtherUnit.ether).toString();
  }

  static getGasPrice() async {
    // 创建一个 EtherDart 实例
    final etherDart = EtherDart();

    /// 这是我的 RpcHost - 你也可以使用 QuickNode 来创建
    const myHost = starknetNet;

    /// 连接以太坊到提供者
    /// 在这种情况下，客户端是一个 HTTP 客户端（用于向你的 Rpc 主机发送请求）
    final provider = etherDart.connectProvider(Web3Client(myHost, Client()));

    /// 使用提供者执行不同的操作
    /// 例如 - 获取 gas 价格
    /// 例如 - 发送交易等等
    final gasPrice = await provider.getGasPrice();
    print("以太坊 Gas 价格 ${gasPrice.getInWei}");

    // /// 使用立即连接的 EtherDart 创建一个 EtherDart 实例
    final etherDartWithConnect =
        EtherDart.connect(Web3Client(myHost, Client()));

    // 使用提供者获取 gas 价格
    final gasPriceWithConnect =
        await etherDartWithConnect.provider?.getGasPrice();

    // print("以太坊 Gas 价格（使用连接） ${gasPriceWithConnect?.getInWei}");
    return gasPriceWithConnect?.getInEther.toString();
  }

  //获取gas费用

  //转账汇款
  static sendTransaction(
      String fromAddress, String toAddress, String amount) async {
    const myHost = starknetNet;
    var ethClient = Web3Client(myHost, Client());

    var credentials = EthPrivateKey.fromHex(fromAddress);
    try {
      String txHash = await ethClient.sendTransaction(
        credentials,
        Transaction(
          to: EthereumAddress.fromHex(toAddress),
          gasPrice: EtherAmount.inWei(BigInt.one),
          maxGas: 100000,
          value: EtherAmount.fromUnitAndValue(EtherUnit.wei, int.parse(amount)),
        ),
      );
      if (txHash != null) {
        toastInfo(msg: "Transaction sent successfully");
      }
    } catch (e) {
      toastInfo(msg: "$e");
      // 在这里可以处理交易失败的情况，例如显示错误信息给用户或者执行其他操作
    }
  }
}
