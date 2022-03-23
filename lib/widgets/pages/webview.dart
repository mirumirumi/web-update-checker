import 'dart:io';
import 'dart:async';
import '../../importer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller = Completer<
      WebViewController>();
  bool _isLoading = false;

  // AndroidのWebViewでの日本語入力対応
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    final PageArgs arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: mainAppBar(arg.url),
        body: Column(
          children: [
              LinearProgressIndicator(
                backgroundColor: Color(0xFFfffafafa),
                valueColor:
                _isLoading
                  ? AlwaysStoppedAnimation<Color>(Color(0xFFb5d7b8))
                  : AlwaysStoppedAnimation<Color>(Color(0xFFfafafa)),
              ),
            Expanded(
              child: WebView(
                  initialUrl: arg.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: _controller.complete,
                  onPageStarted: (String url) {
                    setState(() {
                      _isLoading = true;
                    });
                  },
                  onPageFinished: (String url) async {
                    setState(() {
                      _isLoading = false;
                    });
                  }
              ),
            )
          ],
        )
    );
  }
}


