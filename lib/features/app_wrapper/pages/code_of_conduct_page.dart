import 'package:conference_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWithLoadingIndicator extends StatefulWidget {
  const WebViewWithLoadingIndicator({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  State<WebViewWithLoadingIndicator> createState() =>
      _WebViewWithLoadingIndicatorState();
}

class _WebViewWithLoadingIndicatorState
    extends State<WebViewWithLoadingIndicator>
    with SingleTickerProviderStateMixin {
  int progress = 0;
  late WebViewController webViewController;
  late AnimationController animationController;
  late Animation<double> progressAnimation;

  @override
  void initState() {
    webViewController = WebViewController()
      ..loadRequest(Uri.parse(widget.url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(true)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) =>
              animationController.animateTo(progress * 0.01),
        ),
      );

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    progressAnimation =
        Tween<double>(begin: 0.0, end: animationController.upperBound).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: AppAdaptiveIconButton(
              onPressed: context.pop,
              child: const Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
        ),
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: AnimatedBuilder(
            animation: progressAnimation,
            builder: (context, child) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: progressAnimation.value == 1 ||
                        progressAnimation.value < 0.01
                    ? const SizedBox()
                    : LinearProgressIndicator(
                        value: progressAnimation.value,
                        minHeight: 4,
                        backgroundColor: Colors.grey[300],
                      ),
              );
            },
          ),
        ),
      ),
      body: WebViewWidget(controller: webViewController),
    );
  }
}

class CodeOfConductPage extends StatelessWidget {
  const CodeOfConductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WebViewWithLoadingIndicator(
      title: 'Code of Conduct',
      url: 'https://fluttervikings.com/code-of-conduct/',
    );
  }
}
