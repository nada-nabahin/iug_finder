import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/widget/app_text_form.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';

class SearchTextField extends StatefulWidget {
  final void Function(String query) filterCallback;
  const SearchTextField({super.key, required this.filterCallback});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  Timer? _debounce;
  late LostAndMyLostCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<LostAndMyLostCubit>();

    cubit.searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      final query = cubit.searchController.text;
      widget.filterCallback(query); // Call the passed filter function
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    cubit.searchController.removeListener(_onSearchChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: AppTextFormField2(
        controller: cubit.searchController,
        hintText: tr('search_for_reports'),
        backgroundColor: const Color(0xffC7EDF7),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return tr('input_text_to_search');
          }
          return null;
        },
        suffixIcon: const Icon(Icons.search, color: Colors.grey),
      ),
    );
  }
}
