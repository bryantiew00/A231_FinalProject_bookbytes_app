
import 'package:bookbyte/buyer/user.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BillScreen extends StatefulWidget {
  final User user;
  final double totalprice;

  const BillScreen({super.key, required this.user, required this.totalprice});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  var loadingPercentage = 0;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print(widget.user.userPhone);
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
            'https://bryan.infinitebe.com/bookbytes/php/payment.php?&userid=${widget.user.userId}&email=${widget.user.userEmail}&phone=${widget.user.userPhone}&name=${widget.user.userName}&amount=${widget.totalprice}'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}