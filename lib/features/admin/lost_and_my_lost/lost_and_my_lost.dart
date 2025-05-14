import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/theming/styles.dart';
import 'package:iug_finder/core/widget/app_app_bar.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/logic/cubit/lost_and_my_founa_cubit.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/widget/all_lost_tab/lost_tab_screen.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/widget/my_lost_tab/my_lost_tab_screen.dart';

class LostAndMyFoundAdmin extends StatefulWidget {
  final int initialTabIndex;

  const LostAndMyFoundAdmin({super.key, this.initialTabIndex = 0});

  @override
  State<LostAndMyFoundAdmin> createState() => _LostAndMyLostState();
}

class _LostAndMyLostState extends State<LostAndMyFoundAdmin>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2, vsync: this,
      initialIndex: widget.initialTabIndex, // Set the initial tab index
    );
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) return;
    final cubit = context.read<AllLostAndFoundCubit>();
    if (_tabController.index == 0) {
      cubit.getAllLost();
      cubit.clearSearchField(); // Clear the search field when switching tabs
    } else {
      cubit.getAllFoundReport();
      cubit.clearSearchField(); // Clear the search field when switching tabs
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppAppBar(
          title: 'الرئيسية أدمن',
          bottom: TabBar(
            controller: _tabController,

            indicatorColor: Colors.white, // Tab indicator color
            indicatorWeight: 5.0, // Thickness of the indicator
            labelStyle: TextStyles.font18WightSemiBold,
            tabs: const [
              Tab(text: 'المفقودات'), // Tab for Lost items
              Tab(text: 'الموجودات'), // Tab for Found items
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            LostTabScreen(),
            MyLostTabScreen(),
          ],
        ),
      ),
    );
  }
}
