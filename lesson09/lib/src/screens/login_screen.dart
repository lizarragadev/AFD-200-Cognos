// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lesson09/src/provider/auth_provider.dart';
import 'package:lesson09/src/routes/routes.dart';
import 'package:lesson09/src/utils/constants.dart';
import 'package:lesson09/src/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthProvider provider;
  String correo = '';
  String contrasenia = '';

  @override
  void initState() {
    provider = AuthProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    const Positioned(
                      left: 40,
                      width: 80,
                      height: 200,
                      child: Image(
                        image: AssetImage('assets/images/light-1.png'),
                      ),
                    ),
                    const Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child:
                          Image(image: AssetImage('assets/images/light-2.png')),
                    ),
                    const Positioned(
                      right: 30,
                      top: 40,
                      width: 80,
                      height: 150,
                      child:
                          Image(image: AssetImage('assets/images/clock.png')),
                    ),
                    Positioned(
                      child: Container(
                        margin: const EdgeInsets.only(top: 110),
                        child: const Center(
                          child: Text(
                            "Inicio sesión",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 251, .2),
                                blurRadius: 16.0,
                                offset: Offset(1, 1))
                          ]),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200)),
                            ),
                            child: TextField(
                              autofocus: false,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Ingrese su email",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                              onChanged: (nuevoValor) {
                                setState(() {
                                  correo = nuevoValor;
                                });
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: true,
                              autofocus: false,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Ingrese su contraseña",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                              onChanged: (nuevoValor) {
                                setState(() {
                                  contrasenia = nuevoValor;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        validarUsuario();
                      },
                      splashColor: Colors.deepPurpleAccent,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ])),
                        child: const Center(
                          child: Text(
                            "INICIAR SESIÓN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "¿No tienes una cuenta?",
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: const Text(
                            "Regístrate",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RoutePaths.registerScreen);
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Future<void> validarUsuario() async {
    if(correo.isNotEmpty&& contrasenia.isNotEmpty) {
      if(contrasenia.length >= 6) { 
        showBarraProgreso(context, "Iniciando sesión");
        var res = await provider.iniciarSesion(correo, contrasenia);
        Navigator.of(context).pop();
        if(res != null) {
          mostrarMensaje(context, "Inicio de sesión exitoso", Constants.MENSAJE_EXITOSO);
          Navigator.pushReplacementNamed(context, RoutePaths.homeScreen);
        } else {
          mostrarMensaje(context, "Error al registrar", Constants.MENSAJE_ERROR);
        }   
      } else {
        mostrarMensaje(context, "La contraseña debe tener al menos 6 caracteres", Constants.MENSAJE_ERROR);
      }
    } else {
      mostrarMensaje(context, "Existen campios vacíos", Constants.MENSAJE_ERROR );
    }
  }
}
