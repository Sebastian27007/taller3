import 'package:flutter/material.dart';
import 'package:ti3app/main.dart';

class PopupWindow extends StatefulWidget {
  @override
  _PopupWindowState createState() => _PopupWindowState();
}
class _PopupWindowState extends State<PopupWindow> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Términos y condiciones'),
      content: Text('TÉRMINOS Y CONDICIONES'
          'Reglamento de uso de la aplicación móvil.'
          'El presente documento establece las condiciones mediante las cuales se regirá'
          'el uso de la aplicación móvil: Uniandes (en adelante la aplicación), la cual es'
          'operada por la Universidad, identificada con Nit. 860.007.386-1., la cual es una'
          'persona jurídica de derecho privado, consagrada  la educación y a la cultura,'
          'organizada como corporación de utilidad común, sin ánimo de lucro, con personería'
          'jurídica independiente y autonomía académica, administrativa y financiera. Vigilada'
          'por el Ministerio de Educación Nacional, reconocida como persona jurídica mediante'
          'Resolución N° 28 del 23 de febrero de 1949 emitida por el Ministerio de Justicia.'
          ''
          'La aplicación funcionará como un nuevo canal para la realización de ciertas'
          'actividades descritas más adelante con el objeto de facilitar el acceso a la'
          'información a los estudiantes, docentes y administrativos de la Universidad .'
          'El usuario se compromete a leer los términos y condiciones aquí establecidos'
          'y con su aceptación se entiende que cuenta con el conocimiento integral de este'
          'documento y la totalidad de sus estipulaciones. El usuario reconoce que el ingreso'
          'de su información personal, y los datos que contiene la aplicación a su disposición'
          'respecto a su información académica y demás datos personales, la realizan de manera'
          'voluntaria, quienes optan por acceder a esta aplicación en Colombia o desde fuera'
          'del territorio nacional, lo hacen por iniciativa propia y son responsables del'
          'cumplimiento de las leyes locales, en la medida en que dichas leyes sean aplicables'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
          child: Text('Cerrar'),
        ),
      ],
    );
  }
}
