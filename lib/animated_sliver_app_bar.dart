import 'package:fairy_tale/theme/icon_assets.dart';
import 'package:fairy_tale/theme/image_assets.dart';
import 'package:fairy_tale/widget/chapter_widget.dart';
import 'package:fairy_tale/widget/progress_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedSliverAppBar extends SliverPersistentHeaderDelegate {
  const AnimatedSliverAppBar({
    required this.title,
    required this.expandedBarHeight,
    this.collapsedBarHeight = 0,
  });

  final String title;
  final double expandedBarHeight;
  final double collapsedBarHeight;

  @override
  double get maxExtent => expandedBarHeight;

  @override
  double get minExtent => collapsedBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(
    BuildContext _,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    var progress = shrinkOffset / expandedBarHeight;
    var topMargin = collapsedBarHeight * 0.340;
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: progress,
          child: Image.asset(
            ImageAssets.collapsedAntar,
            fit: BoxFit.fill,
          ),
        ),
        Opacity(
          opacity: (1 - progress),
          child: Image.asset(ImageAssets.antar, fit: BoxFit.fill),
        ),
        Positioned(
          left: 12,
          top: topMargin + 4 * progress,
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset(IconAssets.homeMail),
          ),
        ),
        Positioned(
          right: 12,
          top: topMargin + 4 * progress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(IconAssets.content),
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(IconAssets.settings),
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(IconAssets.share),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Column(
            children: [
              const ProgressLine(progress: 0.4),
              ChapterWidget(title: title),
            ],
          ),
        ),
        Positioned(
          right: 12 + 134 * progress,
          top: (topMargin + 4) + expandedBarHeight * 0.493 * (1 - progress),
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              progress < 1 ? IconAssets.player : IconAssets.collapsedPlayer,
            ),
          ),
        ),
      ],
    );
  }
}
