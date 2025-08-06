import 'package:europen_countries_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomItemInformation extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const CustomItemInformation({super.key, required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.darkPrimary.withValues(alpha: 0.05), AppColors.lightPrimary.withValues(alpha: 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).dividerColor.withValues(alpha: 0.5), width: 1),
      ),
      child: Row(children: [_buildIcon(context), const SizedBox(width: 16), _buildContent(context)]),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(color: AppColors.darkPrimary.withValues(alpha: 0.1), shape: BoxShape.circle),
      child: Icon(icon, size: 24, color: AppColors.darkPrimary),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: AppColors.darkPrimary, fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
