import 'package:flutter/material.dart';
import 'package:hesmar/constants/constants.dart';
import 'package:hesmar/services/dio_client.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DioClient _dioClient = DioClient();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(automaticallyImplyLeading: false, elevation: 0),
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.appThemeColor,
            Constants.appThemeColor.withOpacity(0.8),
          ],
        )),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: ClipRect(
                child: ClipRect(
                  child:
                      Image.asset('assets/images/hesmar-logo.png', width: 120),
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
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            enabledBorder: Constants.enabledBorder,
                            border: Constants.disabledBorder,
                            hintText: 'Adınız',
                            hintStyle: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            enabledBorder: Constants.enabledBorder,
                            border: Constants.disabledBorder,
                            hintText: 'Soyadınız',
                            hintStyle: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: Constants.enabledBorder,
                      border: Constants.disabledBorder,
                      hintText: 'E-posta Adresiniz',
                      hintStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      enabledBorder: Constants.enabledBorder,
                      border: Constants.disabledBorder,
                      hintText: 'Şifrenizi Giriniz',
                      hintStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    controller: _addressController,
                    decoration: InputDecoration(
                      enabledBorder: Constants.enabledBorder,
                      border: Constants.disabledBorder,
                      hintText: 'Adresinizi Giriniz',
                      hintStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      style: Constants.style,
                      child: const Text(
                        'KAYDOL',
                        style: TextStyle(color: Constants.appThemeColor),
                      ),
                      onPressed: () {
                        _dioClient
                            .register(
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                address: _addressController.text)
                            .then((value) {
                          Navigator.pushNamed(context, '/login-page');
                        });

                        _firstNameController.clear();
                        _lastNameController.clear();
                        _emailController.clear();
                        _passwordController.clear();
                        _addressController.clear();
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
