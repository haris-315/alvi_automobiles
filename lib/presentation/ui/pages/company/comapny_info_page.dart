// ignore_for_file: deprecated_member_use

import 'package:alvi_automobiles/data/static_data/company_info/company_info.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:flutter/material.dart';

class ComapnyInfoPage extends StatefulWidget {
  const ComapnyInfoPage({super.key});

  @override
  State<ComapnyInfoPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<ComapnyInfoPage> {
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
        title: Image.asset("assets/alvi_no_bg.gif", width: 120),
        centerTitle: true,
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
            AspectRatio(
              aspectRatio: 4 / 5,
              child: Image.asset("assets/car.jpeg"),
            ),
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 22),

                  Text(
                    CompanyInfo.companyInfo,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 16,
                      height: 1.8,
                    ),
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
