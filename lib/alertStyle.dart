import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertLocalStyle {
  static showPwdComparView(context, callBack) {
    TextEditingController pwdController = TextEditingController();
    TextEditingController pwdConfirmController = TextEditingController();
    Alert(
        context: context,
        title: "Setting Password",
        content: Column(
          children: <Widget>[
            TextField(
              controller: pwdController,
              obscureText: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Input Password',
              ),
            ),
            TextField(
              controller: pwdConfirmController,
              obscureText: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'makesure Password',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => {
              if (pwdController.text == pwdConfirmController.text)
                {
                  callBack(pwdController.text),
                  Navigator.pop(context),
                }
              else
                {
                  AlertLocalStyle.showAlertError(
                      context, "Error", "Passwords do not match"),
                }
            },
            child: const Text(
              "Sure",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  static showAlertError(context, title, content) {
    Alert(
      context: context,
      title: title,
      content: Text(content),
      buttons: [
        DialogButton(
          child: const Text("Close"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    ).show();
  }

  static showWalletChoiceView(context, callBack) {
    Alert(
        context: context,
        title: "Create or Import Wallet",
        content: Container(),
        buttons: [
          DialogButton(
            onPressed: () => {
              callBack(1),
              Navigator.pop(context),
            },
            child: const Text(
              "Create a new wallet",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: () => {
              callBack(2),
              Navigator.pop(context),
            },
            child: const Text(
              "Input memonic phrase",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ]).show();
  }
}
