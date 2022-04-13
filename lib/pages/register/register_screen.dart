import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_getx/pages/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final _controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[200],
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            _buildFormLogin()
          ],
        ),
      ),
    );
  }

  Widget _buildFormLogin() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "THE MOVIE",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _controller.namaController,
              cursorColor: Colors.black,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Nama harus diisi";
                }
                return null;
              },
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Input Nama',
                  hintStyle: TextStyle(),
                  labelText: 'Nama Lengkap',
                  labelStyle: TextStyle(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _controller.emailController,
              cursorColor: Colors.white,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email harus diisi";
                }
                return null;
              },
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Input Email',
                hintStyle: TextStyle(),
                labelText: 'Email',
                labelStyle: TextStyle(),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password harus diisi";
                }
                return null;
              },
              obscureText: true,
              controller: _controller.passwordController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Input Password',
                hintStyle: TextStyle(),
                labelText: 'Password',
                labelStyle: TextStyle(),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(16),
                ),
              ), //KETIKA obsecureText bernilai TRUE
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.blue[600],
                  onPressed: () async {
                    _controller.saveToGetStorage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text("Masuk",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto")),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
