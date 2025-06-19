import 'package:alvi_automobiles/core/services/snackbar_service/snackbar_service.dart';
import 'package:alvi_automobiles/presentation/state_management/drawer/cubit/drawer_cubit.dart';
import 'package:alvi_automobiles/presentation/ui/pages/blogs/all_blogs.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/drawer_widgets/drawer_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:page_transition/page_transition.dart';

class AlviDrawer extends StatefulWidget {
  const AlviDrawer({super.key});

  @override
  State<AlviDrawer> createState() => _AlviDrawerState();
}

class _AlviDrawerState extends State<AlviDrawer> {
  @override
  void initState() {
    super.initState();
    context.read<DrawerCubit>().getDrawerItems();
  }

  void defaultAction(VoidCallback cb) {
    Navigator.pop(context);
    cb.call();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerState>(
      listener: (context, state) {
        if (state is DrawerError) {
          print(state.error.stackTrace);
          SnackbarService(
            context,
            snackbarType: SnackbarType.ERROR,
            details: state.error.message,
          );
        }
      },
      builder: (context, state) {
        return Drawer(
          backgroundColor: AppPalette.secondaryBackground,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
              state is DrawerLoading
                  ? Center(
                    child: CircularProgressIndicator(
                      color: AppPalette.goldAccent,
                    ),
                  )
                  : state is DrawerLoaded
                  ? Column(
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.3),
                          border: Border(
                            bottom: BorderSide(
                              color: AppPalette.goldAccent.withValues(
                                alpha: 0.2,
                              ),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/alvi_no_bg.gif",
                            width: 160,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          children: [
                            DrawerItemWidget(
                              title: "Home",
                              onClick: () {
                                defaultAction(() {});
                              },
                              icon: Icons.home_outlined,
                              isSelected: false,
                            ),
                            ...state.drawerItems.map(
                              (di) => DrawerItemWidget(
                                title: di.title,
                                onClick: () {},
                                icon: MdiIcons.carOutline,
                                isSelected: false,
                              ),
                            ),
                            DrawerItemWidget(
                              title: "Blog",
                              onClick: () {
                                defaultAction(() {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: AlviBlogs(),
                                    ),
                                  );
                                });
                              },
                              icon: Icons.article_outlined,
                              isSelected: false,
                            ),
                            DrawerItemWidget(
                              title: "Community",
                              onClick: () {},
                              icon: Icons.people_outline,
                              isSelected: false,
                            ),
                            DrawerItemWidget(
                              title: "Company",
                              onClick: () {},
                              icon: MdiIcons.officeBuildingOutline,
                              isSelected: false,
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'Alvi Automobiles © ${DateTime.now().year}',
                          style: TextStyle(
                            color: AppPalette.secondaryText.withValues(
                              alpha: 0.6,
                            ),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                  : Center(
                    child: Text(
                      "There was an error",
                      style: TextStyle(color: AppPalette.secondaryText),
                    ),
                  ),
        );
      },
    );
  }
}
