import 'package:flutter/material.dart';



class LoginApp extends StatelessWidget{
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors:
                  [Color.fromRGBO(63,63,156,1),
                    Color.fromRGBO(90,70,178,1)] )
              ),
              //color: Colors.purpleAccent,
              width: double.infinity,
              height: size.height * 0.4,
            ),
            SafeArea( child:
            Container(
              margin: const EdgeInsets.only(top:30),
              width: double.infinity,
              child: const Icon(Icons.person_pin,
                color: Colors.white,
                size: 100,
              ),
            ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 250,),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    height: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow:const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ]),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 10,),
                        Text('Login',
                          style: Theme.of(context).textTheme.headlineMedium,),
                        const SizedBox(height: 30,),
                        Form(
                          child: Column(
                            children: <Widget>[TextFormField(
                              autocorrect: false,
                              decoration:  const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurpleAccent)),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purpleAccent,
                                      width: 2),),
                                hintText: 'ejemplo@gmail.com',
                                labelText: 'correo electrónico',
                                prefixIcon: Icon(Icons.alternate_email_rounded),
                              ),
                            ),
                              const SizedBox(height: 30,),
                              TextFormField(
                                autocorrect: false,
                                decoration:  const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.deepPurpleAccent)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.purpleAccent,
                                        width: 2),),
                                  hintText: 'ingresa contraseña',
                                  labelText: 'contraseña',
                                  prefixIcon: Icon(Icons.lock_outline),
                                ),
                              ),
                              const SizedBox(height: 30,),
                              MaterialButton(onPressed: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),
                                //);
                              },
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                disabledColor: Colors.grey,
                                color: Colors.deepPurpleAccent,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                                  child: const Text('Ingresar',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                  const Text('Crear una nueva cuenta',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}