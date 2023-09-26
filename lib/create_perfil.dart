import 'package:flutter/material.dart';

class UserPerfil extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.blue, Colors.lightGreenAccent],)
                  ),
                  //color: Colors.purpleAccent,
                  width: double.infinity,
                  height: size.height * 0.4,
                ),

              ],
        ),
      ),
    );
  }
}