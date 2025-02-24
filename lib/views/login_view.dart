import 'package:flutter/material.dart';
import 'package:movie_app/services/user.dart';
import 'package:movie_app/widgets/alert.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  UserService user = UserService(); //variable user digunakan untuk memanggil function yang ada di folder services untuk mensinkron dengan backend
  final formKey = GlobalKey<FormState>(); //formKey digunakan untuk membuat validator form input.
  TextEditingController email = TextEditingController(); //Email dan password digunakan untuk menyimpan nilai input
  TextEditingController password = TextEditingController();
  bool isLoading = false; //Variable isLoading digunakan untuk menampilkan loading Ketika proses berlangsung.
  bool showPass = true; //Sedangkan showPass digunakan untuk menampilkan password atau menyembunyikan password di form input password.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(label: Text("Email")),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email harus diisi';
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField( //Di textFormField diberi suffix agar bisa ditambahkan icon sebelah kanan yang berupa mata melihat dan mata disilang, didalamnya diberi logika jika true maka akan tampil mata melihat jika false akan tampil mata disilang
                        controller: password,
                        obscureText: showPass,
                        decoration: InputDecoration(
                          label: Text("Password"),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            icon: showPass
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password harus diisi';
                          } else {
                            return null;
                          }
                        },
                      ),

                      SizedBox(height: 10),
                      
                      MaterialButton(
                        onPressed: (

                        ) async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            var data = {
                              "email": email.text,
                              "password": password.text,
                            };
                            var result = await user.loginUser(data);
                            setState(() {
                              isLoading = false;
                            });
                            print(result.message);
                            if (result.status == true) {
                              AlertMessage()
                                  .showAlert(context, result.message, true);
                                  Future.delayed(Duration(seconds: 2), () {
                                Navigator.pushReplacementNamed(context, '/dashboard');
                              });
                            } else {
                              AlertMessage()
                                  .showAlert(context, result.message, false);
                            }
                          }
                        },
                        child: isLoading == false
                            ? Text("LOGIN")
                            : CircularProgressIndicator(),
                        color: Colors.lightGreen,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );

  }
}