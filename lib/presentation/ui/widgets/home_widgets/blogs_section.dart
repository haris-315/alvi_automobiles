import 'package:alvi_automobiles/core/network/constants/network_constants.dart';
import 'package:alvi_automobiles/data/models/blogs/blog.dart';
import 'package:alvi_automobiles/data/static_data/static_blog_data/blogs_data.dart';
import 'package:alvi_automobiles/presentation/ui/pages/home/blog_detail_page.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BlogsSection extends StatelessWidget {
  const BlogsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'LATEST ARTICLES',
            style: TextStyle(
              color: AppPalette.goldAccent,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Stay updated with our latest news and stories',
            style: TextStyle(
              color: AppPalette.secondaryText.withValues(alpha: 0.8),
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 340,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: blogList.length,
            separatorBuilder: (_, __) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              final blog = blogList[index];
              return BlogCard(blog: blog);
            },
          ),
        ),

        SizedBox(height: 25),
      ],
    );
  }
}

class BlogCard extends StatelessWidget {
  final Blog blog;
  const BlogCard({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: BlogDetailPage(blog: blog),
          ),
        );
      },
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[800]!, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "${NetworkConstants.baseUrlNoSlash}${blog.featuredImage}",
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) => Container(
                          color: Colors.grey[800],
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppPalette.goldAccent,
                            ),
                          ),
                        ),
                    errorWidget:
                        (context, url, error) => Container(
                          color: Colors.grey[800],
                          child: Center(
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        blog.chapter.toUpperCase(),
                        style: TextStyle(
                          color: AppPalette.goldAccent,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blog.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      blog.excerpt,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppPalette.secondaryText.withValues(alpha: 0.8),
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.grey[800],
                          backgroundImage: CachedNetworkImageProvider(
                            "${NetworkConstants.baseUrlNoSlash}${blog.author.authorImage}",
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            blog.author.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: AppPalette.goldAccent,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
