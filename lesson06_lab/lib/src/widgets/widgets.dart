import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

PreferredSizeWidget appBar(context) {
  return AppBar(
    title: const Text("WOW Pizza"),
    backgroundColor: Colors.deepOrangeAccent,
    actions: crearAcciones(context),
  );
}

List<Widget> crearAcciones(context) {
  return [
    IconButton(
      icon: const Icon(Icons.star),
      onPressed: () {
        Navigator.pushNamed(context, "webview", arguments: "x.com");
      },
    ),
    IconButton(
      icon: const Icon(Icons.facebook),
      onPressed: () {
        Navigator.pushNamed(context, "webview", arguments: "facebook.com");
      },
    ),
  ];
}

Widget crearBotones(context) {
  return ButtonBar(
    alignment: MainAxisAlignment.center,
    children: [
      stadiumButton(context, "Pizza Uno", "pizza1"),
      stadiumButton(context, "Pizza Dos", "pizza2"),
      stadiumButton(context, "Pizza Tres", "pizza3"),
    ],
  );
}

Widget stadiumButton(context, nombreBoton, nombreRuta) {
  return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, nombreRuta);
      },
      style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.deepOrangeAccent, width: 2)),
      child: Text(
        nombreBoton,
        style: const TextStyle(color: Colors.deepOrangeAccent),
      ));
}

Widget crearContenidoHome() {
  return const Center(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image(image: AssetImage("assets/images/banner.png")),
          SizedBox(
            height: 20,
          ),
          Text(
            "Hola, soy tu asistente de Pizzas, ¿Cómo puedo ayudarte?",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}

Widget crearContenidoImg(imagen, titulo) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Image(
          image: AssetImage(imagen),
          width: 400,
        )
      ]),
    ),
  );
}

Widget webViewBase(url) {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(url));

  return Center(
    child: WebViewWidget(
      controller: controller,
    ),
  );
}
