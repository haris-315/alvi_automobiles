import 'package:alvi_automobiles/core/services/snackbar_service/snackbar_service.dart';
import 'package:alvi_automobiles/presentation/state_management/drawer/cubit/drawer_cubit.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/drawer_widgets/drawer_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

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
          child:
              state is DrawerLoading
                  ? Center(
                    child: CircularProgressIndicator(
                      color: AppPalette.goldAccent,
                    ),
                  )
                  : state is DrawerLoaded
                  ? ListView(
                    children: [
                      DrawerHeader(
                        child: Column(
                          children: [Image.asset("assets/alvi_no_bg.gif")],
                        ),
                      ),
                      DrawerItemWidget(
                        title: "Home",
                        onClick: () {},
                        icon: Icons.home,
                      ),
                      ...state.drawerItems.map(
                        (di) => DrawerItemWidget(
                          title: di.title,
                          onClick: () {},
                          icon: MdiIcons.car,
                        ),
                      ),
                      DrawerItemWidget(
                        title: "Blog",
                        onClick: () {},
                        icon: Icons.pages,
                      ),
                      DrawerItemWidget(
                        title: "Community",
                        onClick: () {},
                        icon: Icons.people,
                      ),
                      DrawerItemWidget(
                        title: "Company",
                        onClick: () {},
                        icon: MdiIcons.officeBuilding,
                      ),
                    ],
                  )
                  : Text("There was an error"),
        );
      },
    );
  }
}
