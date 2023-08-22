import 'package:flutter/material.dart';
import 'package:lesson06_lab/src/widgets/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String urlWebView =
        ModalRoute.of(context)?.settings.arguments as String;

    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://$urlWebView"));

    return Scaffold(
      appBar: appBar(context),
      body: WebViewWidget(controller: controller),
    );
  }
}
