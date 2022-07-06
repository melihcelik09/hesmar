import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/constants/constants.dart';
import 'package:hesmar/services/dio_client.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final DioClient _dioClient = DioClient();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                height: 400,
                width: 300,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    TextField(
                      controller: _emailController,
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
                    TextField(
                      obscureText: true,
                      controller: _passwordController,
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
                            borderSide: const BorderSide(color: Colors.white)),
                        hintText: 'Şifrenizi Giriniz',
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/password-remember');
                        },
                        child: const Text(
                          'Şifremi unuttum',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        )),
                    const SizedBox(height: 10),
                    Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        return Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                primary: Colors.white,
                                fixedSize: const Size(200, 40)),
                            child: const Text(
                              'GİRİŞ YAP',
                              style: TextStyle(color: Constants.appThemeColor),
                            ),
                            onPressed: () {
                              var testmail = 'alperugur@gmail.com';
                              var pass = '1234';
                              // Test
                              // _dioClient
                              //     .login(
                              //         password: pass, email: testmail, ref: ref)
                              //     .then((value) {
                              //   Navigator.pushNamed(context, '/home-page');
                              // });
                              //Live
                              _dioClient
                                  .login(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      ref: ref)
                                  .then(
                                (value) {
                                  Navigator.pushNamed(context, '/home-page');
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Colors.white,
                      thickness: 3,
                      endIndent: 20,
                      indent: 20,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              primary: Colors.white,
                              fixedSize: const Size(130, 40)),
                          child: const Text(
                            'KAYDOL',
                            style: TextStyle(color: Constants.appThemeColor),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/register-page');
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              primary: Colors.white,
                              fixedSize: const Size(130, 40)),
                          child: const Text(
                            'MİSAFİR GİRİŞİ',
                            style: TextStyle(color: Constants.appThemeColor),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home-page');
                          },
                        ),
                      ],
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
