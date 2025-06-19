import 'package:alvi_automobiles/data/static_data/static_blog_data/blogs_data.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/common/alvi_appbar.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/common/alvi_drawer.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/home_widgets/blogs_section.dart';
import 'package:flutter/material.dart';

class AlviBlogs extends StatefulWidget {
  const AlviBlogs({super.key});

  @override
  State<AlviBlogs> createState() => _AlviBlogsState();
}

class _AlviBlogsState extends State<AlviBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AlviDrawer(),
      backgroundColor: AppPalette.scaffoldBackground,
      appBar: alviAppBar(
        title: "Alvi Blogs",
        hasDrawer: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppPalette.goldAccent),
        ),
      ),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: blogList.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 14,
          crossAxisSpacing: 12,
          childAspectRatio: 4 / 4.5,
          crossAxisCount: 1,
        ),
        // : (_, __) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          final blog = blogList[index];
          return BlogCard(blog: blog);
        },
      ),
    );
  }
}
