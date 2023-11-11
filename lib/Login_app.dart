import 'package:flutter/material.dart';
import 'package:ti3app/Screens/Screen1.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ti3app/api_connection/api_connection.dart';
import 'package:ti3app/model/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ti3app/model/user_preferences.dart';
//import 'package:ti3app/main.dart';
import 'package:ti3app/signup_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  loginUserNow()async{
    try{
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          "user_email": emailController.text.trim(),
          "user_password" : passwordController.text.trim(),
        },
      );
      if(res.statusCode == 200){
        var resBodyOfLogin = jsonDecode(res.body);
        if(resBodyOfLogin['success']==true){
          Fluttertoast.showToast(msg: 'Ingreso exitoso.');
          User userInfo = User.fromJson(resBodyOfLogin["userData"]);

          await RememberUserPrefs.saveRememberUser(userInfo);
          Future.delayed(Duration(milliseconds: 2000),(){
            Get.to(Myscreen());
          });
        }else{
          Fluttertoast.showToast(msg: 'Usuario o contaseña incorrectos, intente de nuevo.');
        }
      }
    }catch(e){
      print("error:: " + e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: Colors.white, // Puedes cambiar a otro color según tu preferencia
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.lightGreenAccent]),
              ),
              width: double.infinity,
              height: size.height * 0.4,
            ),
            SafeArea(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                child: const Icon(
                  Icons.person_pin,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    height: 400,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'Login',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(height: 30),
                        Form(
                          key: formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                validator: (val) => val == "" ? "Por favor ingrese su email" : null,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  hintText: "email...",
                                  // Resto de las propiedades de diseño...
                                ),
                              ),
                              const SizedBox(height: 10),
                              Obx(() => TextFormField(
                                controller: passwordController,
                                obscureText: isObsecure.value,
                                validator: (val) => val == "" ? "Por favor ingrese su contrasena" : null,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.vpn_key_sharp,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      isObsecure.value = !isObsecure.value;
                                    },
                                    child: Icon(
                                      isObsecure.value ? Icons.visibility_off : Icons.visibility,
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "password...",
                                  // Resto de las propiedades de diseño...
                                ),
                              ),
                              ),
                              const SizedBox(height: 10),
                              Material(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                                child: InkWell(
                                  onTap: () {
                                    if (formkey.currentState!.validate()) {
                                      loginUserNow();
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(30),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 28,
                                    ),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿No tienes cuenta?',
                      ),
                      TextButton(
                        onPressed: (){
                          Get.to(SignUpScreen());
                        },
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}