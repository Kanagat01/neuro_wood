// import 'dart:async';
// import 'dart:io';
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
// import 'package:neuro_wood/core/ui/theme.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter/material.dart';

// class WebviewScreen extends StatefulWidget {
//   const WebviewScreen({
//     super.key,
//     required this.url,
//   });
//   final String url;

//   @override
//   State<WebviewScreen> createState() => _WebviewScreenState();
// }

// class _WebviewScreenState extends State<WebviewScreen> {
//   final Completer<WebViewController> _controller = Completer<WebViewController>();

//   @override
//   void initState() {
//     super.initState();
//     if (Platform.isAndroid) {
//       WebView.platform = SurfaceAndroidWebView();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       appBar: AppBar(
//         backgroundColor: NeuroWoodColors.white,
//         elevation: 0,
//         leadingWidth: 90,
//         leading: Row(
//           children: [
//             IconButton(
//               color: NeuroWoodColors.black,
//               splashRadius: 24,
//               onPressed: () {
//                 context.pop();
//               },
//               icon: const Icon(NeuroWoodIcons.arrowLeft),
//             ),
//             Text(
//               "backButton".tr(),
//               style: Theme.of(context).textTheme.titleSmall?.copyWith(
//                     color: NeuroWoodColors.black,
//                   ),
//             )
//           ],
//         ),
//       ),
//       body: WebView(
//         initialUrl: widget.url,
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (WebViewController webViewController) {
//           _controller.complete(webViewController);
//         },
//         gestureNavigationEnabled: true,
//         backgroundColor: NeuroWoodColors.white,
//       ),
//     );
//   }
// }
