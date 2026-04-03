import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:notes_and_todos/core/theme/colors.dart';
import '../state_management/theme_notifier.dart';

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Theme", style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(
            width: 80,
            height: 34,
            child: GestureDetector(
              onTap: () => ref.read(themeProvider.notifier).toggle(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).cardColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Light
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: isDark ? Colors.transparent : Theme.of(context).primaryColor,
                      ),
                      child: Icon(
                        LucideIcons.sun600,
                        size: 16,
                        color: isDark ? Theme.of(context).primaryColor : AppColors.darkTextPrimary,
                      ),
                    ),
                    // Dark
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: isDark ? Theme.of(context).primaryColor : Colors.transparent,
                      ),
                      child: Icon(
                        LucideIcons.moon600,
                        size: 16,
                        color: isDark ? AppColors.darkTextPrimary : Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
