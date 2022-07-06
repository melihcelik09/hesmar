import 'package:flutter/material.dart';

import '../constants/constants.dart';

class PasswordRemember extends StatelessWidget {
  const PasswordRemember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Constants.appThemeColor,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Constants.appThemeColor,
                Constants.appThemeColor.withOpacity(0.8),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                child: ClipRect(
                  child: Image.asset(
                    'assets/images/hesmar-logo.png',
                    width: 120,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 250,
                width: 300,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Şifremi unuttum',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        )),
                    const SizedBox(height: 10),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: 'E-posta Adresiniz',
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            primary: Colors.white,
                            fixedSize: const Size(200, 40)),
                        child: const Text(
                          'GÖNDER',
                          style: TextStyle(color: Constants.appThemeColor),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login-page');
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
