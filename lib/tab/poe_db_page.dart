import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PoeDbPage extends StatefulWidget {
  PoeDbPage({Key key}) : super(key: key);

  @override
  _PoeDbPageState createState() => _PoeDbPageState();
}

class _PoeDbPageState extends State<PoeDbPage>
    with AutomaticKeepAliveClientMixin {
  Completer<WebViewController> _controller;

  @override
  void initState() {
    super.initState();
    _controller = Completer<WebViewController>();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://poedb.tw/cn',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
        setState(() {});
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
