import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/theming/styles.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';

class LostFoundPostCard extends StatelessWidget {
  final Report? reportsModel;
  final bool isMyReport;
  final void Function()? onDeleteTap;

  const LostFoundPostCard({
    super.key,
    this.reportsModel,
    required this.isMyReport,
    this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Name and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reportsModel?.fullName ?? 'Unknown',
                    style: TextStyles.font18DarkBlueBold,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        'تاريخ الإنشاء: ${reportsModel?.createdAt?.split('T').first ?? 'غير معروف'}',
                        style: TextStyles.font12GrayRegular,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  if (isMyReport)
                    GestureDetector(
                      onTap: () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('حذف البلاغ'),
                            content: const Text(
                                'هل أنت متأكد من رغبتك في حذف هذا البلاغ؟'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('إلغاء'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('حذف',
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );

                        if (confirmed == true &&
                            reportsModel?.reportID != null) {
                          if (context.mounted) {
                            context
                                .read<LostAndMyLostCubit>()
                                .deleteReport(reportsModel!.reportID!);
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.delete_forever,
                          color: ColorsManager.red800,
                          size: 28,
                        ),
                      ),
                    ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: reportsModel?.status == "موجود"
                          ? ColorsManager.green100
                          : ColorsManager.red100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      reportsModel?.status ?? '',
                      style: GoogleFonts.cairo(
                        color: reportsModel?.status == "مفقود"
                            ? ColorsManager.red800
                            : ColorsManager.green800,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Image
          if (reportsModel?.photo != null && reportsModel!.photo!.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'http://10.0.2.2:3000/uploads/${reportsModel!.photo}',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
          const SizedBox(height: 12),
          // Description
          Text(
            'الوصف: ${reportsModel?.description ?? 'لا يوجد وصف'}',
            style: TextStyles.font14BlackMedium,
          ),
          const SizedBox(height: 8),
          // Location
          Text(
            'المكان: ${reportsModel?.location ?? 'غير معروف'}',
            style: TextStyles.font14BlackMedium,
          ),
          const SizedBox(height: 12),
          // Report Time and Creation Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    'الوقت: ${reportsModel?.reportTime ?? 'غير معروف'}',
                    style: TextStyles.font12GrayRegular,
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_today,
                      size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    'التاريخ: ${reportsModel?.reportDate?.split('T').first ?? 'غير معروف'}',
                    style: TextStyles.font12GrayRegular,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
