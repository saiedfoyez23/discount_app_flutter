import 'package:discount_me_app/view/users/home_view/controller/payment_controller.dart' show PaymentController;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OrderPaymentView extends StatefulWidget {
  const OrderPaymentView({super.key,required this.paymentUrl});
  final String paymentUrl;
  @override
  State<OrderPaymentView> createState() => _OrderPaymentViewState();
}

class _OrderPaymentViewState extends State<OrderPaymentView> {
  late final WebViewController _controller;
  final PaymentController paymentController = Get.put(PaymentController());
  @override
  void initState() {
    super.initState();
    // Initialize WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            // Show loading indicator if needed
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            // Page loaded
            print('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            // Handle errors
            print('Error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) async {
            print("hello ${request.url}");
            //Handle redirects or specific URLs (e.g., success/failure callbacks)
            await paymentController.getPaymentController(context: context, paymentUrl: request.url);
            if (request.url.contains('success') || request.url.contains('failure')) {
              //Handle payment result
              //_handlePaymentResult(request.url);

              return NavigationDecision.prevent; // Prevent navigation in WebView
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl)); // Load the Paymob URL
  }

  // Handle payment result based on redirect URL
  // void _successPage({required PaymentSuccessFullResponse paymentSuccessFullResponse}) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentConfirmationScreen(paymentSuccessFullResponse: paymentSuccessFullResponse)));
  // }


  // void _failedPage() {
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionScreen()));
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
