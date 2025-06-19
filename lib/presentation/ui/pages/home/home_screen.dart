import 'package:alvi_automobiles/presentation/state_management/home/cubit/home_cubit.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/common/alvi_appbar.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/common/alvi_drawer.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/home_widgets/blogs_section.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/home_widgets/faqs_section.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/home_widgets/home_shimmer.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/home_widgets/page_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlviHome extends StatefulWidget {
  const AlviHome({super.key});

  @override
  State<AlviHome> createState() => _AlviHomeState();
}

class _AlviHomeState extends State<AlviHome> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadLandingData(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          drawer: AlviDrawer(),
          appBar: alviAppBar(hasDrawer: true),

          backgroundColor: AppPalette.scaffoldBackground,
          body:
              state is HomeLoading
                  ? HomeShimmer()
                  : state is HomeLoaded
                  ? SingleChildScrollView(
                    child: Column(
                      children: [
                        ...state.landingData.map((li) => PageItem(li: li)),
                        FaqsSection(),
                        BlogsSection(),
                      ],
                    ),
                  )
                  : state is HomeError
                  ? Text("There was an error...")
                  : SizedBox.shrink(),
        );
      },
    );
  }
}
