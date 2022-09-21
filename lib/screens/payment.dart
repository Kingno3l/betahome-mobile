import 'dart:developer';
import 'dart:io';

import 'package:beta_home/helper/consts.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_paystack_payment/flutter_paystack_payment.dart';

class Payment extends StatefulWidget {
  final double amount;
  const Payment({Key? key, required this.amount}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final String _email = 'monadesola@gmail.com';
  final double _amount = 100;
  String _cardNo = '';
  String _cardExp = '';
  String _cardCvv = '';
  String _cardName = '';
  bool _isCvvFocused = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final plugin = PaystackPayment();

  @override
  void initState() {
    plugin.initialize(publicKey: Consts.PAYSTACK_PUB_KEY);
    super.initState();
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      _cardNo = creditCardModel.cardNumber;
      _cardExp = creditCardModel.expiryDate;
      _cardName = creditCardModel.cardHolderName;
      _cardCvv = creditCardModel.cvvCode;
      _isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  void _onPay() async {
    try {
      var expArr = _cardExp.split('/');
      if (expArr.length != 2) return;

      _formKey.currentState?.save();
      PaymentCard card = PaymentCard(
          number: _cardNo,
          cvc: _cardCvv,
          expiryMonth: expArr[0],
          expiryYear: expArr[1]);
      Charge charge = Charge()
        ..amount = 1000
        ..email = _email
        ..card = card
        ..reference = _getReference();
      CheckoutResponse response =
          await plugin.checkout(context, charge: charge);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final double amount = widget.amount;

    return Scaffold(
      appBar: ScreenBar.build(context, 'Payment'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CreditCardWidget(
              cardNumber: _cardNo,
              expiryDate: _cardExp,
              cardHolderName: _cardName,
              cvvCode: _cardCvv,
              showBackView: _isCvvFocused,
              obscureCardNumber: false,
              obscureCardCvv: true,
              height: 150,
              textStyle: const TextStyle(color: Colors.yellowAccent),
              width: MediaQuery.of(context).size.width,
              animationDuration: const Duration(milliseconds: 500),
              onCreditCardWidgetChange: (CreditCardBrand) {},
            ),
            CreditCardForm(
              formKey: _formKey,
              onCreditCardModelChange: onCreditCardModelChange,
              obscureCvv: true,
              obscureNumber: false,
              cardNumber: _cardNo,
              cardNumberDecoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                border: OutlineInputBorder(borderSide: BorderSide(width: 3)),
                labelText: 'Card Number',
                hintText: 'XXXX XXXX XXXX XXXX',
              ),
              expiryDate: _cardExp,
              expiryDateDecoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                border: OutlineInputBorder(),
                labelText: 'Expiry Date',
                hintText: 'XX/XX',
              ),
              cvvCode: _cardCvv,
              cvvCodeDecoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                border: OutlineInputBorder(),
                labelText: 'CVV',
                hintText: 'XXX',
              ),
              cardHolderName: _cardName,
              isHolderNameVisible: false,
              cardHolderDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Card Holder Name',
              ),
              themeColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
              child: ElevatedButton(
                onPressed: _onPay,
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    backgroundColor: const Color(0xFFFFDA58)),
                child: Text('Pay NGN $amount',
                    style: const TextStyle(color: Color(0xFF000000))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock_outlined,
                  size: 12,
                ),
                const SizedBox(
                  width: 4,
                ),
                Image.asset(
                  './lib/assets/imgs/paystack.png',
                  height: 14,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getReference() {
    log("We are here");
    String platform;
    if (!kIsWeb) {
      if (Platform.isIOS) {
        platform = 'iOS';
      } else if (Platform.isLinux) {
        platform = 'linux';
      } else if (Platform.isMacOS) {
        platform = 'macOS';
      } else if (Platform.isFuchsia) {
        platform = 'fuchsia';
      } else if (Platform.isWindows) {
        platform = 'windows';
      } else {
        platform = 'android';
      }
      // platform = 'Unknown';
    } else {
      platform = "web";
    }

    return 'charged_from_${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }
}
