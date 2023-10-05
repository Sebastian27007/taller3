// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ti3app/create_perfil.dart';


class contactsApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserPerfil()),
            );
          },
        ),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.lightGreenAccent],)
            ),
            width: double.infinity,
            height: size.height * 1.0,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 30,),
                SingleChildScrollView(
                   child: Column(
                      children: [Container(
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        height: 400,
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
                              ],
                            ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20,),
                            Text('Contactos',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [ElevatedButton(onPressed: (){}, child: Text('Agregar contacto'),
                                ),
                                ElevatedButton(onPressed: (){}, child: Text('Eliminar contacto'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Card(
                              elevation: 5,
                                color: Colors.white,
                                margin: const EdgeInsets.all(5),
                                child: ListTile(
                                  title: const Text('Contacto 1'),
                                  trailing: const Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  onTap: (){
                                    //aqui se agrega la funcionalidad
                                  }
                                ),
                            ),
                            Card(
                              elevation: 5,
                                color: Colors.white,
                                margin: const EdgeInsets.all(5),
                                child: ListTile(
                                  title: const Text('Contacto 2'),
                                  trailing: const Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  onTap: (){
                                    //aqui se agrega la funcionalidad
                                  }
                                ),
                            ),
                            Card(
                              elevation: 5,
                                color: Colors.white,
                                margin: const EdgeInsets.all(5),
                                child: ListTile(
                                  title: const Text('Contacto 3'),
                                  trailing: const Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  onTap: (){
                                    //aqui se agrega la funcionalidad
                                  }
                                ),
                            ),
                          ],             
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ), 
      ),
    );
  }
}