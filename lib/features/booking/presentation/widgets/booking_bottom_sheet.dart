import 'package:flutter/material.dart';

class BookingBottomSheet extends StatelessWidget {
  final VoidCallback onSearchPressed;

  const BookingBottomSheet({
    super.key,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onTap: onSearchPressed,
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'Where to?',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[100],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavigationIcon(
                context,
                icon: Icons.home_outlined,
                label: 'Home',
                onTap: () {
                  // TODO: Navigate to home location
                },
              ),
              _buildNavigationIcon(
                context,
                icon: Icons.work_outline,
                label: 'Work',
                onTap: () {
                  // TODO: Navigate to work location
                },
              ),
              _buildNavigationIcon(
                context,
                icon: Icons.history,
                label: 'Recent',
                onTap: () {
                  // TODO: Show recent locations
                },
              ),
              _buildNavigationIcon(
                context,
                icon: Icons.star_border,
                label: 'Saved',
                onTap: () {
                  // TODO: Show saved places
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildNavigationIcon(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 28),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
