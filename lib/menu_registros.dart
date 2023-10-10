import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FormularioApp(),
    );
  }
}

class FormularioApp extends StatefulWidget {
  const FormularioApp({super.key});

  @override
  _FormularioAppState createState() => _FormularioAppState();
}

class _FormularioAppState extends State<FormularioApp> {
  final _formKey = GlobalKey<FormState>();
  String? _nombre;
  String? _apellido;
  String? _usuario;
  String? _email;
  String? _celular;
  String? _contrasena;
  bool _aceptarTerminos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú de registros de usuarios'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, ingresa tu nombre';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nombre = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Apellido'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, ingresa tu apellido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _apellido = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, ingresa tu usuario';
                  }
                  return null;
                },
                onSaved: (value) {
                  _usuario = value;
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Correo electrónico'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, ingresa tu correo electrónico';
                  }
                  if (!isValidEmail(value!)) {
                    return 'Ingresa un correo electrónico válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Número de teléfono'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, ingresa tu número de teléfono';
                  }
                  if (!isValidPhoneNumber(value!)) {
                    return 'Ingresa un número de teléfono válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _celular = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, ingresa tu contraseña';
                  }
                  return null;
                },
                onSaved: (value) {
                  _contrasena = value;
                },
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                title: const Text('Aceptar términos y condiciones'),
                value: _aceptarTerminos,
                onChanged: (value) {
                  setState(() {
                    _aceptarTerminos = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    if (_aceptarTerminos) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Información del Formulario'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('Nombre: $_nombre'),
                                Text('Apellido: $_apellido'),
                                Text('Usuario: $_usuario'),
                                Text('Correo Electrónico: $_email'),
                                Text('Número de Teléfono: $_celular'),
                                const Text(
                                    'Contraseña: ****'), // Contraseña oculta
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cerrar'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                'Debes aceptar los términos y condiciones.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cerrar'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Cerrar Sesión'),
                      content: const Text(
                          '¿Estás seguro de que deseas cerrar sesión?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Implementar la lógica de cierre de sesión aquí
                            Navigator.of(context).pop();
                          },
                          child: const Text('Sí'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('No'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Cerrar Sesión'),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Cambiar Idioma'),
                      content: const Text('Selecciona tu idioma preferido:'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Implementar la lógica para cambiar el idioma aquí
                            Navigator.of(context).pop();
                          },
                          child: const Text('Español'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Implementar la lógica para cambiar el idioma aquí
                            Navigator.of(context).pop();
                          },
                          child: const Text('Inglés'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Cambiar Idioma'),
            ),
            // Botón de ayuda y soporte
            FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Ayuda y Soporte'),
                      content: const Text('¿En qué podemos ayudarte?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Implementa la lógica para la ayuda aquí
                            Navigator.of(context).pop();
                          },
                          child: const Text('Ayuda'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Implementa la lógica para el soporte aquí
                            Navigator.of(context).pop();
                          },
                          child: const Text('Soporte'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(Icons.help_outline),
              backgroundColor:
                  Colors.blue, // Cambia el color según tus preferencias
            ),
          ],
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email);
  }

  bool isValidPhoneNumber(String phoneNumber) {
    return RegExp(r'^\d{10}$').hasMatch(phoneNumber);
  }
}
