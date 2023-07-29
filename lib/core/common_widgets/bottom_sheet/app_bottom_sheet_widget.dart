import 'package:flutter/material.dart';
import 'package:tiktok/core/common_widgets/bottom_sheet/app_bottom_sheet_types.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/constants/shortcuts.dart';

class AppBottomSheet<T> extends StatelessWidget {
  final bool supportKeyboard;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final WidgetBuilder builder;
  final bool listViewMode;
  final AppBottomSheetType appBottomSheetType;

  const AppBottomSheet._({
    Key? key,
    this.supportKeyboard = false,
    required this.builder,
    required this.initialChildSize,
    required this.minChildSize,
    required this.maxChildSize,
    this.listViewMode = true,
    this.appBottomSheetType = AppBottomSheetType.listView,
  }) : super(key: key);

  static Future<T?> show<T>(
    BuildContext context, {
    Key? key,
    bool supportKeyboard = false,
    double? initialChildHeight,
    double? initialChildSize,
    double minChildSize = 0.25,
    double maxChildSize = 1.0,
    bool listViewMode = true,
    AppBottomSheetType appBottomSheetType = AppBottomSheetType.listView,
    required WidgetBuilder builder,
  }) {
    // final spacing = context.spacing;
    final screenHeight = context.screenHeight;

    /// temporary use (Screen height - 140) for backward compatibility
    final defaultChildSize = initialChildSize ??=
        (initialChildHeight ?? (screenHeight - 140)) / screenHeight;

    assert(maxChildSize >= minChildSize);
    assert(initialChildSize >= minChildSize);
    //  assert(initialChildSize <= maxChildSize);

    //  use DraggableScrollableSheet
    /// Ref: https://api.flutter.dev/flutter/widgets/DraggableScrollableSheet-class.html
    return showModalBottomSheet<T?>(
      context: context,
      isScrollControlled: supportKeyboard,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.p16),
          topRight: Radius.circular(Sizes.p16),
        ),
      ),
      builder: (context) {
        return AppBottomSheet._(
          key: key,
          supportKeyboard: supportKeyboard,
          initialChildSize: defaultChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          builder: builder,
          appBottomSheetType: appBottomSheetType,
          listViewMode: listViewMode,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    var padding = mediaQueryData.padding;
    if (mediaQueryData.padding.bottom == 0.0 &&
        mediaQueryData.viewInsets.bottom != 0.0) {
      padding = padding.copyWith(
        bottom: mediaQueryData.viewPadding.bottom,
      );
    }

    EdgeInsetsGeometry margin = EdgeInsets.zero;
    if (supportKeyboard) {
      margin = EdgeInsets.only(
        // top: supportKeyboard ? padding.top + paddingTop : 0,
        top: supportKeyboard ? padding.top : 0,
      );
    }

    final screenHeight = mediaQueryData.size.height;

    final contentHeight = initialChildSize * screenHeight;
    final topMargin = screenHeight - contentHeight;

    margin = margin.add(
      EdgeInsets.only(
        top: topMargin,
      ),
    );

    return Builder(
      builder: (context) {
        if (appBottomSheetType.isFlexContent) {
          return SafeArea(
            child: _bottomSheetContainer(
              context,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
                child: Builder(
                  builder: builder,
                ),
              ),
            ),
          );
        } else if (appBottomSheetType.isListView) {
          return Stack(
            children: [
              // this part makes top padding tappable to be able to
              // close the popup
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                behavior: HitTestBehavior.translucent,
                child: const SizedBox.expand(),
              ),
              SafeArea(
                bottom: false,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: minChildSize * screenHeight,
                    maxHeight: maxChildSize * screenHeight,
                  ),
                  child: _bottomSheetContainer(
                    context,
                    margin: margin,
                    child: Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
                        child: Builder(
                          builder: builder,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (appBottomSheetType.isDraggableScroll) {
          return DraggableScrollableSheet(
            minChildSize: minChildSize,
            maxChildSize: maxChildSize,
            expand: true,
            builder: (context, scrollController) {
              return _bottomSheetContainer(
                context,
                showScrollbar: true,
                scrollController: scrollController,
                child: Expanded(
                  child: Scrollbar(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Builder(
                          builder: builder,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
    //   },
    // );
  }

  Widget _bottomSheetContainer(
    BuildContext context, {
    EdgeInsetsGeometry? margin,
    required Widget child,
    ScrollController? scrollController,
    bool showScrollbar = false,
  }) {
    //final spacing = context.spacing;

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.p24),
          topRight: Radius.circular(Sizes.p24),
        ),
      ),
      child: Builder(
        builder: (context) {
          final Widget content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              child,
            ],
          );
          // if (showScrollbar) {
          //   return Scrollbar(
          //     controller: scrollController,
          //     child: SingleChildScrollView(
          //       controller: scrollController,
          //       child: content,
          //     ),
          //   );
          // }
          return content;
        },
      ),
    );
  }
}
