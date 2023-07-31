import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/features/settings_privacy/view/widgets/container_setting.dart';
import 'package:tiktok/features/settings_privacy/view/widgets/scaffold_settings_screen.dart';
import 'package:tiktok/router/app_router.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldSettingScreen(
      title: 'Language',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
        child: Column(
          children: [
            ContainerSettings(
              widget: [
                OptionSettings(
                  label: 'App Language',
                  sublabel: 'Select your default app language',
                  selectOption: 'English',
                  onTap: () {
                    context.push(AppRouter.appLanguagePath);
                  },
                ),
                gapH12,
                OptionSettings(
                  label: 'Preferred language',
                  sublabel:
                      'This will help us customize your viewing experience.',
                )
              ],
            ),
            gapH20,
            ContainerSettings(
              title: 'Translations',
              widget: [
                OptionSettings(
                  label: 'Translation language',
                  sublabel:
                      'Language you\'d like to have videos translated into.',
                  selectOption: 'English',
                ),
                gapH12,
                OptionSettings(
                  label: 'Always show translations',
                  sublabel:
                      'When turned on, video description and captions will be translated into your translation language, if avaiable.',
                  suffixIcon: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
