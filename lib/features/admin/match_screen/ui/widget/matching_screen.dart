import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/theming/styles.dart';
import 'package:iug_finder/core/widget/app_app_bar.dart';
import 'package:iug_finder/features/admin/match_screen/logic/cubit/matching_cubit.dart';
import 'package:iug_finder/features/admin/match_screen/data/models/matchine_model_response.dart';
import 'package:iug_finder/features/admin/match_screen/logic/cubit/matching_state.dart';

class MatchingScreen extends StatelessWidget {
  const MatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MatchingCubit>();

    return SafeArea(
      child: Scaffold(
        appBar: AppAppBar(
          title: "شاشة المطابقة",
        ),
        body: BlocBuilder<MatchingCubit, MatchingState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text('')),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (response) {
                final matchingData = cubit.allMatchingData;
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: matchingData.length,
                  itemBuilder: (context, index) {
                    final match = matchingData[index];
                    return GestureDetector(
                      onTap: () {
                        _showDetailsBottomSheet(context, match);
                      },
                      child: _buildMatchingCard(match),
                    );
                  },
                );
              },
              error: (error) => Center(
                child: Text(
                  'Error: $error',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMatchingCard(MatchData match) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "بلاغ مفقود",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "النوع: ${match.lost.itemType}",
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              "اللون: ${match.lost.color}",
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              "المكان: ${match.lost.location}",
              style: const TextStyle(fontSize: 14),
            ),
            const Divider(height: 20, thickness: 1),
            Text(
              "بلاغ موجود",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "النوع: ${match.found.itemType}",
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              "اللون: ${match.found.color}",
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              "المكان: ${match.found.location}",
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetailsBottomSheet(BuildContext context, MatchData match) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Lost Report Details
                Text(
                  "تفاصيل بلاغ مفقود",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 8),
                if (match.lost.photo != null && match.lost.photo!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'http://11.11.11.74:3000/uploads/${match.lost.photo}',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Text("Failed to load image")),
                    ),
                  ),
                const SizedBox(height: 8),
                Text("النوع: ${match.lost.itemType}"),
                Text("اللون: ${match.lost.color}"),
                Text("المكان: ${match.lost.location}"),
                Text("التاريخ: ${match.lost.reportDate}"),
                // Text("اسم المبلغ: ${match.lost.reporterName ?? 'غير معروف'}"),
                // Text("رقم الاتصال: ${match.lost.contactNumber ?? 'غير متوفر'}"),
                const Divider(height: 20, thickness: 1),

                // Found Report Details
                Text(
                  "تفاصيل بلاغ موجود",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8),
                if (match.found.photo != null && match.found.photo!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'http://11.11.11.74:3000/uploads/${match.found.photo}',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Text("خطأ في تحميل الصورة")),
                    ),
                  ),
                const SizedBox(height: 8),
                Text("النوع: ${match.found.itemType}"),
                Text("اللون: ${match.found.color}"),
                Text("المكان: ${match.found.location}"),
                Text("التاريخ: ${match.found.reportDate}"),
                // Text("اسم المبلغ: ${match.found.reporterName ?? 'غير معروف'}"),
                // Text("رقم الاتصال: ${match.found.contactNumber ?? 'غير متوفر'}"),
                const SizedBox(height: 16),

                // Close Button
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("إغلاق"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
