import 'package:flutter/material.dart';
import 'package:ti3app/create_perfil.dart';


class AppSettings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes de tu Cuenta'),
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
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.lightGreenAccent],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          //color: Colors.purpleAccent,
          height: size.height * 1.0,
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  const SizedBox(height: 30,),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          height: 500,
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
                              const SizedBox(height: 10,),
                              Text('Ajustes',
                               style: Theme.of(context).textTheme.headline4,),
                              const SizedBox(height: 30,),
                              Card(
                                elevation: 5,
                                color: Colors.white,
                                margin: const EdgeInsets.all(5),
                                child: ListTile(
                                  title: const Text('Administrar contraseñas'),
                                  trailing: const Icon(
                                    Icons.arrow_right,
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
                                  title: const Text('Permisos de la App'),
                                  trailing: const Icon(
                                    Icons.arrow_right,
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
                                  title: const Text('Sesiones Agendadas'),
                                  trailing: const Icon(
                                    Icons.arrow_right,
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
                                  title: const Text('Eliminar cuenta'),
                                  trailing: const Icon(
                                    Icons.arrow_right,
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
            ],
          ),
        ),
      ),
    );
  }
}