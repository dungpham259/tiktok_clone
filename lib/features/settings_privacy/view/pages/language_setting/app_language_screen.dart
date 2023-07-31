import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/core/common_widgets/custom_container/disabled_widget.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/constants/constants.dart';
import 'package:tiktok/core/constants/shortcuts.dart';
import 'package:tiktok/features/app/cubit/app_cubit.dart';
import 'package:tiktok/features/settings_privacy/view/widgets/container_setting.dart';
import 'package:tiktok/features/settings_privacy/view/widgets/scaffold_settings_screen.dart';
import 'package:tiktok/l10n/l10n.dart';
import 'package:tiktok/router/app_router.dart';

class AppLanguageScreen extends StatefulWidget {
  const AppLanguageScreen({super.key});

  @override
  State<AppLanguageScreen> createState() => _AppLanguageScreenState();
}

class _AppLanguageScreenState extends State<AppLanguageScreen> {
  var isChangedLocale = false;
  var currentSelect;
  @override
  void initState() {
    currentSelect = context.read<AppCubit>().state.locale;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) {
        return previous.locale != current.locale;
      },
      builder: (context, state) {
        final localizations = context.localizations;
        final supportedLocales = context.supportedLocales;
        final enableDone = currentSelect != state.locale;
        return ScaffoldSettingScreen(
            title: localizations.appLanguage,
            leadingWidth: 75,
            leading: Center(
              child: InkWell(
                onTap: () {
                  context.pop();
                },
                child: Text(
                  localizations.cancel,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            actions: [
              DisabledWidget(
                disabled: !enableDone,
                child: InkWell(
                  onTap: () {
                    context.read<AppCubit>().onLocaleChanged(
                          locale: currentSelect,
                        );
                    context.go(AppRouter.homePath);
                  },
                  child: Text(
                    localizations.done,
                    style: context.textTheme.titleMedium!.copyWith(
                      color: enableDone
                          ? $constants.appColor.kRedMain
                          : $constants.appColor.kTextColor2,
                    ),
                  ),
                ),
              ),
              gapW16,
            ],
            body: Column(
              children: [
                ContainerSettings(widget: [
                  ...List.generate(
                    supportedLocales.length,
                    (index) {
                      var languageCode = supportedLocales[index].languageCode;
                      return Row(
                        children: [
                          Expanded(
                            child: Text(
                              localizations
                                  .pageSettingsInputLanguage(languageCode),
                              style: context.textTheme.titleMedium,
                            ),
                          ),
                          Transform.scale(
                            scale: 1.5,
                            child: Radio<String>(
                              value: languageCode,
                              groupValue: currentSelect,
                              onChanged: (value) {
                                if (value != null)
                                  setState(() {
                                    currentSelect = value;
                                  });
                              },
                              activeColor: $constants.appColor.kRedMain,
                            ),
                          ),
                        ],
                      );
                    },
                  )
                ]),
              ],
            ));
      },
    );
  }
}
