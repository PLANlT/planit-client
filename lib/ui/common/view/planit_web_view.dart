import 'package:flutter/material.dart';
import 'package:planit/ui/common/const/web_view_params.dart';
import 'package:planit/ui/common/view/default_layout.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlanitWebView extends StatefulWidget {
  static String get routeName => 'webView';

  final WebViewParams params;

  const PlanitWebView({
    super.key,
    required this.params,
  });

  @override
  State<PlanitWebView> createState() => _PlanitWebViewState();
}

class _PlanitWebViewState extends State<PlanitWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.params.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: widget.params.title,
      child: WebViewWidget(controller: controller),
    );
  }
}
