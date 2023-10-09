<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# Flutter Paypal Pay

## Features
## Upgrade to PayPal v2 API: A Modern Solution

In this sdk, I've transitioned from using the deprecated PayPal v1 API to the latest and most advanced PayPal v2 API. This shift represents a significant improvement in my package, ensuring the utmost security, reliability, and compatibility with current industry standards.

### Key Highlights

- **Upgrade to PayPal v2 API:** I've embraced the latest PayPal v2 API, which offers enhanced functionality, improved security, and a more robust feature set compared to the outdated v1 API.

- **Creating Orders with Ease:** My package now leverages the power of the v2 API to seamlessly create orders, making the process more efficient and user-friendly.

- **Effortless Order Capture:** With the v2 API integration, order capture has become even more straightforward and reliable, ensuring that your transactions are processed smoothly.

- **Stay Current and Compliant:** By using the latest API version, I ensure that my package remains compliant with PayPal's evolving standards, reducing the risk of potential issues or disruptions in your payment processing.

- **Future-Proof Your Application:** With the v2 API, you can future-proof your application, as it aligns with PayPal's ongoing development efforts and ensures that you'll continue to receive support and updates.

Upgrade your package today to take advantage of these significant enhancements and enjoy a more secure and efficient payment processing experience.

#### Recommended usage
If you're selling digital products or services within your app, you can use this SDK to process payments via paypal.

## Installation
```sh
dart pub 
```
## How to use the library
```dart

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
```

## Additional information

TODO: Go to https://developer.paypal.com/ and create account the you will get **clientId** and **secretKey** use that to your App. 

