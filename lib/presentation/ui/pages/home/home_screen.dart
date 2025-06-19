import 'package:alvi_automobiles/presentation/state_management/home/cubit/home_cubit.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/common/alvi_appbar.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/common/alvi_drawer.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/home_widgets/blogs_section.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/home_widgets/faqs_section.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/home_widgets/home_loader.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/home_widgets/page_item.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/home_widgets/signup_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlviHome extends StatefulWidget {
  const AlviHome({super.key});

  @override
  State<AlviHome> createState() => _AlviHomeState();
}

class _AlviHomeState extends State<AlviHome> {
  final ScrollController _scrollController = ScrollController();
  bool shouldShowFab = false;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadLandingData(context);
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
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
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
          endDrawer: AlviDrawer(),
          appBar: alviAppBar(hasDrawer: true),

          backgroundColor: AppPalette.scaffoldBackground,
          body:
              state is HomeLoading
                  ? HomeLoader()
                  : state is HomeLoaded
                  ? SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        ...state.landingData.map((li) => PageItem(li: li)),
                        FaqsSection(),
                        BlogsSection(),
                        SignupSection(),
                      ],
                    ),
                  )
                  : state is HomeError
                  ? Center(child: Text("There was an error..."))
                  : SizedBox.shrink(),
        );
      },
    );
  }
}
