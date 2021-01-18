import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TradePage extends StatefulWidget {
  TradePage({Key key}) : super(key: key);

  @override
  _TradePageState createState() => _TradePageState();
}

class _TradePageState extends State<TradePage>
    with AutomaticKeepAliveClientMixin {
  Completer<WebViewController> _controller;

  @override
  void initState() {
    super.initState();
    _controller = Completer<WebViewController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('市集'),
      ),
      body: WebView(
        initialUrl: 'https://poe.game.qq.com/trade',
        javascriptMode: JavascriptMode.unrestricted,
        // onWebViewCreated: (WebViewController webViewController) {
        //   _controller.complete(webViewController);
        //   setState(() {});
        // },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
