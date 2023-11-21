import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'nombre',
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'apellido',
                decoration: InputDecoration(labelText: 'Apellido'),
                validator: FormBuilderValidators.required(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    // Acciones a realizar cuando el formulario es válido
                    Map<String, dynamic> formData =
                        _formKey.currentState?.value ?? {};
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MiPerfilScreen(formData),
                      ),
                    );
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiPerfilScreen extends StatelessWidget {
  final Map<String, dynamic> formData;

  MiPerfilScreen(this.formData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${formData['nombre']}'),
            Text('Apellido: ${formData['apellido']}'),
            // Agrega más campos según tu formulario
          ],
        ),
      ),
    );
  }
}
