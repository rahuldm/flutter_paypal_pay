import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_pay/flutter_paypal_pay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Paypal Pay Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => PaypalPay(

                    /// sandboxMode true for testing purposes
                    sandboxMode: true,

                    /// you will find the client Id after login to paypal developer account .
                    clientId:
                        'AUBmOxdWgvJkGsRf2GZMO96quth3L53nF0B-KBpT5C3JgiJrvifwZuoOMrAkyBWZpw_UaYLVTH162brY',

                    ///you will find the secret key after login to paypal developer account .
                    secretKey:
                        'EBQfKl5oAPlCsGADhNCFe7T8m55PvK1XJO9RgJCjZXpEHfVsLhYhcyjDVAlPe9eF_UW1eJgJN7jb8-Ai',
                    returnURL: 'https://test.com/return',
                    cancelURL: 'https://test.com/cancel',
                    purchaseUnits: const [
                      {
                        'amount': {
                          'value': '100',
                          'currency_code': 'USD',
                        },
                        'shipping': {
                          'address': {
                            // Add your shipping address details here

                            'recipient_name': 'Name',
                            'line1': 'Travis County',
                            'line2': '',
                            'city': 'Austin',
                            'country_code': 'US',
                            'postal_code': '73301',
                            'phone': '+00000000',
                            'state': 'Texas',
                            'admin_area_2':
                                'City Name', // Replace 'City Name' with the actual city or locality name
                            'admin_area_1':
                                'State/Province', // Replace 'State/Province' with the actual state or province name
                          }
                        }
                      }
                    ],
                    note: 'Contact us for any questions on your order.',
                    onSuccess: (Map params) async {
                      //for view the response
                      //response data can be usef for backend validation
                      log('successsss: $params');
                    },
                    onError: (error) {
                      //for view the response
                      log('onEEEEError: $error');
                    },
                    onCancel: (params) {
                      //for view the response
                      log('cancelled: $params');
                    }),
              ),
            );
          },
          child: const Text('Pay with Paypal'),
        ),
      ),
    );
  }
}
