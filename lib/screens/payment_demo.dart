import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  late Razorpay razorpay;

  @override
  void initState() {
    razorpay = Razorpay();

    // Payment success
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSucess);
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  void handlePaymentSucess() {
    print("Payment was successful");
  }

  void openCheckout() {
    var options = {
      "key": "[YOUR_API_KEY]",
      "amount": 200,
      "name": "Codzify",
      "description": "Course fees for app development course",
      "prefill": {"contact": "8805073570", "email": "initeshmethani@gmail.com"},
      "external": {
        "wallets": ["paytm", "googlepay"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text("Pay Now"),
          onPressed: openCheckout,
        ),
      ),
    );
  }
}
