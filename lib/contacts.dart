import 'package:flutter/material.dart';

class contacts extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                  children: [
                   const SizedBox(height: 30,),
                   Container(
                    padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      height: 450,
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
                          Text('Contactos',
                            style: Theme.of(context).textTheme.headline4,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(onPressed: (){}, child: Text(
                                'Añadir Contacto'
                              ),),
                              ElevatedButton(onPressed: (){}, child: Text(
                                'Eliminar contacto Contacto'
                              ),),
                            ],
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