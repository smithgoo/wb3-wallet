import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertStyle {
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
                  AlertStyle.showAlertError(
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
}
