import 'package:flutter/material.dart';
import 'package:lesson09/src/provider/auth_provider.dart';
import 'package:lesson09/src/routes/routes.dart';
import 'package:lesson09/src/utils/constants.dart';
import 'package:lesson09/src/utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late AuthProvider provider;
  String correo = "";
  String contrasenia = "";

  @override
  void initState() {
    super.initState();
    provider = AuthProvider();
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
                        image: AssetImage('assets/images/background2.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/clock.png'))),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-2.png'))),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-1.png'))),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        margin: const EdgeInsets.only(top: 110),
                        child: const Center(
                          child: Text(
                            "Registro",
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
                                color: Color.fromRGBO(49, 144, 252, 0.2),
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
                      splashColor: Colors.blue,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(143, 201, 251, 1.0),
                              Color.fromRGBO(32, 97, 149, 0.6),
                            ])),
                        child: const Center(
                          child: Text(
                            "REGISTRARSE",
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
                          "¿Ya tienes una cuenta?",
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: const Text(
                            "Inicia Sesión",
                            style: TextStyle(
                                color: Color.fromRGBO(32, 97, 149, 0.6),
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RoutePaths.loginScreen);
                          },
                        )
                      ],
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
        showBarraProgreso(context, "Registrando");
        var res = await provider.registrar(correo, contrasenia);
        Navigator.of(context).pop();
        if(res != null) {
          mostrarMensaje(context, "Registro exitoso", Constants.MENSAJE_EXITOSO);
          Navigator.pushReplacementNamed(context, RoutePaths.loginScreen);
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
