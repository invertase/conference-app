import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_buttons.dart';

class AppSliverAppBar extends StatefulWidget {
  const AppSliverAppBar({
    Key? key,
    required this.title,
    required this.scrollController,
    this.subtitle,
    this.expandedHeight = 200,
    this.collapsedHeight = 70,
    this.onRefresh,
    this.translateSubtitle = true,
    this.automaticallyImplyLeading = true,
    this.centerTitle = true,
    this.actions = const <Widget>[],
    this.contentMainAxisAlignment,
    this.expandedTitleStyle,
    this.content,
    this.confirmBeforePop,
    this.titleColor,
    this.backgroundColor,
    this.backgroundImage,
    this.alwaysCollapsed = false,
    this.bottom,
    this.pinned,
  }) : super(key: key);

  final ScrollController scrollController;
  final AsyncCallback? onRefresh;
  final String title;
  final String? subtitle;
  final double expandedHeight;
  final double collapsedHeight;
  final bool translateSubtitle;
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final List<Widget> actions;
  final MainAxisAlignment? contentMainAxisAlignment;
  final TextStyle? expandedTitleStyle;
  final Widget? content;
  final Future<bool> Function()? confirmBeforePop;
  final Color? titleColor;
  final Color? backgroundColor;
  final String? backgroundImage;
  final bool alwaysCollapsed;
  final PreferredSizeWidget? bottom;
  final bool? pinned;
  @override
  State<AppSliverAppBar> createState() => _AppSliverAppBarState();
}

class _AppSliverAppBarState extends State<AppSliverAppBar> {
  double scrollProgress = 1;

  void scrollControllerListener() {
    double offset = widget.scrollController.position.pixels;
    // When offset < 0 => stretching
    // Expanded = true & scrollProgress = 0 (min)
    // When offset >= expandedHeight - collapsedHeight
    // Expanded = false & scrollProgress = 1 (max)
    // When offset <= expandedHeight - collapsedHeight && offset > 0
    // scrollProgress = offset / expandedHeight (values between 0 <=> 1)
    if (offset > (widget.expandedHeight - widget.collapsedHeight)) {
      setState(() => scrollProgress = 0);
    } else {
      setState(() => scrollProgress = 1);
    }
  }

  @override
  void initState() {
    if (!widget.alwaysCollapsed) {
      widget.scrollController.addListener(scrollControllerListener);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (!widget.alwaysCollapsed) {
      widget.scrollController.removeListener(scrollControllerListener);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: widget.automaticallyImplyLeading
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 40,
                height: 40,
                child: AppAdaptiveIconButton(
                  onPressed: context.pop,
                  child: const Icon(Icons.arrow_back_ios_rounded),
                ),
              ),
            )
          : null,
      expandedHeight: widget.expandedHeight,
      title: AnimatedSlide(
        offset: Offset(0, scrollProgress),
        duration: const Duration(milliseconds: 100),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: 1 - scrollProgress,
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      bottom: widget.bottom,
      backgroundColor: widget.backgroundColor,
      pinned: widget.pinned ?? true,
      stretch: !widget.alwaysCollapsed,
      collapsedHeight: widget.collapsedHeight,
      onStretchTrigger: widget.onRefresh,
      elevation: 0.0,
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
        child: FlexibleSpaceBar(
          background: widget.backgroundImage != null
              ? CachedNetworkImage(
                  imageUrl: widget.backgroundImage!,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                )
              : null,
        ),
      ),
    );
  }
}
