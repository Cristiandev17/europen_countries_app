import 'package:europen_countries_app/core/theme/app_colors.dart';
import 'package:europen_countries_app/core/utils/number_formatting.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final CountryEntity country;
  final Function()? onTap;
  final IconData iconTap;
  final Function()? onTapIcon;
  const CustomCard({super.key, required this.country, this.onTap, this.onTapIcon, required this.iconTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      shadowColor: AppColors.black,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFlagSection(context),
            _buildContentSection(context, Theme.of(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildFlagSection(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 128,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [AppColors.darkPrimary, AppColors.lightPrimary.withValues(alpha: 0.9)]),
          ),
          child: Center(
            child: Image.network(
              country.flag,
              height: 60,
              width: 60,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.flag_outlined, size: 40, color: Colors.white),
            ),
          ),
        ),
        if (onTapIcon != null) _buildActionButton(context),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4, offset: const Offset(0, 2))],
        ),
        child: IconButton(
          icon: Icon(iconTap, size: 20),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: onTapIcon,
        ),
      ),
    );
  }

  Widget _buildContentSection(BuildContext context, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            country.name,
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(context, icon: Icons.location_on, label: 'Capital', value: country.capital),
          const SizedBox(height: 8),
          _buildInfoRow(context, icon: Icons.people, label: 'Population', value: country.population.withThousandsSeparator),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, {required IconData icon, required String label, required dynamic value}) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(color: AppColors.darkPrimary.withValues(alpha: 0.1), shape: BoxShape.circle),
          child: Center(child: Icon(icon, size: 12, color: AppColors.darkPrimary)),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.6)),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            value.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
