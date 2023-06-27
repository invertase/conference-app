import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as htmlparser;
import 'package:url_launcher/url_launcher_string.dart';

class ActivityDetailsPage extends StatefulWidget {
  const ActivityDetailsPage({
    super.key,
    required this.activity,
  });

  final Activity activity;
  @override
  State<ActivityDetailsPage> createState() => _ActivityDetailsPageState();
}

class _ActivityDetailsPageState extends State<ActivityDetailsPage> {
  late dom.Document document;
  late String html;

  @override
  void initState() {
    html = widget.activity.content;
    document = htmlparser.parse(html);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConferenceAppBar(title: widget.activity.title),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
            20, 10, 20, MediaQuery.of(context).padding.bottom + 20),
        child: Column(
          children: [
            if (widget.activity.banner != null)
              CachedNetworkImage(
                imageUrl: widget.activity.banner!,
                fit: BoxFit.cover,
              ),
            Html.fromDom(
              document: document,
              style: {
                'p': Style(fontSize: FontSize.large),
                'div': Style(lineHeight: const LineHeight(1.5)),
              },
              onLinkTap: (url, attributes, element) {
                if (attributes['href'] != null) {
                  launchUrlString(
                    attributes['href']!,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
