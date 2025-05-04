import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/theming/styles.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';
import 'package:iug_finder/features/lost_and_my_lost/widget/all_lost_tab/lost_tab_screen.dart';
import 'package:iug_finder/features/lost_and_my_lost/widget/my_lost_tab/my_lost_tab_screen.dart';

class LostAndMyLost extends StatefulWidget {
  const LostAndMyLost({super.key});

  @override
  State<LostAndMyLost> createState() => _LostAndMyLostState();
}

class _LostAndMyLostState extends State<LostAndMyLost>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) return;
    final cubit = context.read<LostAndMyLostCubit>();
    if (_tabController.index == 0) {
      cubit.getAllLost();
      cubit.clearSearchField(); // Clear the search field when switching tabs
    } else {
      cubit.getMyReports();
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
        appBar: AppBar(
          title: Text(
            'البلاغات',
            style: TextStyles.font18DarkBlueBold,
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorsManager
                      .mainBlue, // Replace with your gradient start color
                  ColorsManager
                      .lightBlue, // Replace with your gradient start color
                ],
              ),
            ),
          ),
          bottom: TabBar(
            controller: _tabController,

            indicatorColor: Colors.white, // Tab indicator color
            indicatorWeight: 5.0, // Thickness of the indicator
            labelStyle: TextStyles.font18WightSemiBold,
            tabs: const [
              Tab(text: 'البلاغات'),
              Tab(text: 'بلاغاتي'),
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
