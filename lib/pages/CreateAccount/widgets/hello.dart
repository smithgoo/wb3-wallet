import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class SubWidgets {
  Widget EnterEmail({var screen, emailController}) {
    return Container(
      width: screen.width,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
                padding: const EdgeInsets.all(25.0),
                width: screen.width - 20,
                child: Column(children: [
                  Image.asset(
                    'assets/image/Template_3/deals_layout/cardMenu.png',
                    width: screen.width / 3,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Enter your email address",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Email address is used for login, to identify unique users",
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "you@example.com",
                        labelText: "Email Address",
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                      onChanged: (val) async {}),
                  const SizedBox(height: 20.0),
                ])),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(children: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
            ]),
          )
        ],
      ),
    );
  }

  Widget EnterInfo(
      {var screen, phoneController, nameController, passwordController}) {
    return Container(
      width: screen.width,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
                padding: const EdgeInsets.all(25.0),
                width: screen.width - 20,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Image.asset(
                    'assets/image/Template_3/deals_layout/financeMenu.png',
                    width: screen.width / 3,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Enter your personal information",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Details are required to store information and personalised experience",
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: nameController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Joe Doe',
                      hintText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: phoneController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Phone Number',
                      hintText: 'XXXXX-XXXXX',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                      hintText: 'Password must be 8 in length.',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Confirm Password',
                      hintText: 'Same as password',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  true
                      ? const CircularProgressIndicator(
                          backgroundColor: Colors.greenAccent,
                        )
                      : const SizedBox()
                ]))),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )),
              ]))
        ],
      ),
    );
  }

  Widget EnterCode({var screen, emailText}) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        width: screen.width,
        child: Stack(children: [
          Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                padding: const EdgeInsets.all(25.0),
                width: screen.width - 20,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Image.asset(
                    'assets/image/Template_3/deals_layout/buildingMenu.png',
                    width: screen.width / 3,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Verify code",
                    style: TextStyle(fontSize: 22.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  emailText == null
                      ? const SizedBox()
                      : Text(
                          // ignore: prefer_interpolation_to_compose_strings
                          "Verification code is sent to " + emailText,
                          style: const TextStyle(
                              color: Colors.green, fontSize: 12.0),
                          textAlign: TextAlign.center,
                        ),
                  const SizedBox(height: 10.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Check Mail",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Resend Code",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )),
                      ]),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const TextField(
                    controller: null,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'max 5 digits',
                      hintText: 'max 5 digits',
                    ),
                  ),
                ])),
              )),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                  padding:
                      EdgeInsets.only(right: 10.0, left: 10.0, bottom: 5.0),
                  child: Column(children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )),
                  ])))
        ]));
  }
}
