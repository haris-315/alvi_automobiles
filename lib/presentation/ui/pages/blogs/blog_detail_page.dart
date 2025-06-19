// ignore_for_file: deprecated_member_use

import 'package:alvi_automobiles/core/network/constants/network_constants.dart';
import 'package:alvi_automobiles/data/models/blogs/blog.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:intl/intl.dart';

class BlogDetailPage extends StatefulWidget {
  final Blog blog;

  const BlogDetailPage({super.key, required this.blog});

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  final ScrollController _scrollController = ScrollController();
  bool shouldShowFab = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 180) {
        setState(() {
          shouldShowFab = true;
        });
      } else {
        setState(() {
          shouldShowFab = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'MMMM dd, yyyy',
    ).format(widget.blog.publishedDate);

    return Scaffold(
      floatingActionButton:
          shouldShowFab
              ? FloatingActionButton.small(
                backgroundColor: AppPalette.goldAccent,

                onPressed: () {
                  _scrollController.animateTo(
                    0,
                    duration: Duration(milliseconds: 600),
                    curve: Curves.linear,
                  );
                },
                child: Icon(
                  Icons.arrow_upward,
                  color: AppPalette.scaffoldBackground,
                ),
              )
              : null,
      appBar: AppBar(
        title: Text(
          widget.blog.chapter.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            letterSpacing: 1.1,
          ),
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
        iconTheme: IconThemeData(color: AppPalette.goldAccent),
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl:
                  "${NetworkConstants.baseUrlNoSlash}${widget.blog.featuredImage}",
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
              placeholder:
                  (context, url) => Container(
                    height: 280,
                    color: Colors.grey[800],
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppPalette.goldAccent,
                      ),
                    ),
                  ),
              errorWidget:
                  (context, url, error) => Container(
                    height: 280,
                    color: Colors.grey[800],
                    child: Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.grey[600],
                        size: 40,
                      ),
                    ),
                  ),
            ),
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.blog.title,
                    style: TextStyle(
                      color: AppPalette.pearlWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey[800],
                        backgroundImage: CachedNetworkImageProvider(
                          "${NetworkConstants.baseUrlNoSlash}${widget.blog.author.authorImage}",
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.blog.author.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            formattedDate,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.chat_outlined,
                                size: 12,
                                color: AppPalette.secondaryText,
                              ),
                              SizedBox(width: 5),
                              Text(
                                widget.blog.comments.toString(),
                                style: TextStyle(
                                  color: AppPalette.secondaryText,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.favorite_outline,
                                size: 12,
                                color: AppPalette.secondaryText,
                              ),
                              SizedBox(width: 5),
                              Text(
                                widget.blog.likes.toString(),
                                style: TextStyle(
                                  color: AppPalette.secondaryText,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      IconButton.outlined(
                        style: ButtonStyle(
                          side: WidgetStateBorderSide.resolveWith(
                            (_) => BorderSide(color: AppPalette.pearlWhite),
                          ),
                          shape: WidgetStateOutlinedBorder.resolveWith(
                            (_) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.facebook,
                          color: AppPalette.disabledText,
                        ),
                      ),
                      SizedBox(width: 18),
                      IconButton.outlined(
                        style: ButtonStyle(
                          side: WidgetStateBorderSide.resolveWith(
                            (_) => BorderSide(color: AppPalette.pearlWhite),
                          ),
                          shape: WidgetStateOutlinedBorder.resolveWith(
                            (_) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          MdiIcons.instagram,
                          color: AppPalette.disabledText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Text(
                    widget.blog.content,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 16,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 32),

                  if (widget.blog.tags.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          widget.blog.tags
                              .map(
                                (tag) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: AppPalette.goldAccent.withValues(
                                        alpha: 0.3,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    tag,
                                    style: TextStyle(
                                      color: AppPalette.goldAccent,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
