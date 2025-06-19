import 'package:alvi_automobiles/core/network/constants/network_constants.dart';
import 'package:alvi_automobiles/data/models/home/landing_data_item.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart'
    show AppPalette;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PageItem extends StatefulWidget {
  final LandingDataItem li;
  const PageItem({super.key, required this.li});

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _slideAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1100),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(.4, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: FlippedCurve(Curves.bounceIn),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "GEN-Z 40 ${widget.li.tag}",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppPalette.accentText,
            fontSize: AppPalette.bodyLarge,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 12),

        Text(
          widget.li.title,
          textAlign: TextAlign.center,

          style: TextStyle(
            color: AppPalette.secondaryText,
            fontSize: AppPalette.headlineMedium,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: 14),
        CachedNetworkImage(
          imageUrl: NetworkConstants.baseUrlNoSlash + widget.li.image,
          imageBuilder: (context, imageProvider) {
            _animationController.forward();
            return SlideTransition(
              position: _slideAnimation,
              child: Image(image: imageProvider),
            );
          },
          placeholder:
              (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor:
                    Colors.grey[150] ?? Colors.grey.withValues(alpha: .25),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 16,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.directions_car,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
        ),

        SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 35, minWidth: 120),
              child: OutlinedButton(
                style: ButtonStyle(
                  side: WidgetStateBorderSide.resolveWith(
                    (_) => BorderSide(color: AppPalette.goldAccent),
                  ),
                  shape: WidgetStateOutlinedBorder.resolveWith(
                    (_) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                onPressed: () {},
                child: Text(
                  "Learn More",
                  style: TextStyle(
                    color: AppPalette.accentText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 35, minWidth: 120),
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateColor.resolveWith(
                    (_) => AppPalette.goldAccent,
                  ),
                  side: WidgetStateBorderSide.resolveWith(
                    (_) => BorderSide(color: AppPalette.goldAccent),
                  ),
                  shape: WidgetStateOutlinedBorder.resolveWith(
                    (_) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                onPressed: () {},
                child: Text(
                  "Order Now",
                  style: TextStyle(
                    color: AppPalette.primaryBackground,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Divider(indent: 26, endIndent: 26, color: AppPalette.disabledText),

        SizedBox(height: 35),
      ],
    );
  }
}
