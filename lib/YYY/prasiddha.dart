// import 'package:flutter/material.dart';
// import 'package:flutter_appauth/flutter_appauth.dart';

// class LoginPagee extends StatefulWidget {
//   @override
//   _LoginPageeState createState() => _LoginPageeState();
// }

// class _LoginPageeState extends State<LoginPagee> {
//   final FlutterAppAuth appAuth = FlutterAppAuth();

//   Future<void> _login() async {
//     try {
//       final AuthorizationTokenResponse? result =
//           await appAuth.authorizeAndExchangeCode(
//         AuthorizationTokenRequest(
//           'DigitalGaun_FlutterApp',
//           'http://localhost:4200/callback',
//           discoveryUrl:
//               'http://localhost:4200/.well-known/openid-configuration',
//           scopes: ['email'],
//         ),
//       );

//       // Use the result.idToken or result.accessToken for further processing.
//     } catch (e) {
//       print('Error during login: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _login,
//           child: Text('Login'),
//         ),
//       ),
//     );
//   }
// }
