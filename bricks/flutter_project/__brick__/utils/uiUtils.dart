import 'dart:ui';

class UiUtils {
  static double appContentHorizontalPadding = 20.0;
  static double textFieldFontSize = 16.0;

  static Locale getLocaleFromLanguageCode(String languageCode) {
    List<String> result = languageCode.split("-");
    return result.length == 1
        ? Locale(result.first)
        : Locale(result.first, result.last);
  }

  static String getImagePath(String imageName) {
    return "assets/images/$imageName";
  }

  static String getTranslatedLabel(BuildContext context, String labelKey) {
    return AppLocalization.of(context)!.getTranslatedValues(labelKey) ??
        labelKey;
  }

  static Future<dynamic> showBottomSheet(
      {required Widget child,
      required BuildContext context,
      bool? enableDrag}) async {
    final result = await showModalBottomSheet(
        enableDrag: enableDrag ?? false,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(bottomSheetTopRadius),
                topRight: Radius.circular(bottomSheetTopRadius))),
        context: context,
        builder: (_) => child);

    return result;
  }

  //Date format is dd/mm/yy
  static String formatDate(DateTime dateTime) {
    return "${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}";
  }

  static Future<void> showBottomToastOverlay(
      {required BuildContext context,
      required String message,
      required Color backgroundColor}) async {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => BottomToastOverlayContainer(
        backgroundColor: backgroundColor,
        errorMessage: message,
      ),
    );

    overlayState?.insert(overlayEntry);
    await Future.delayed(bottomToastDisplayDuration);
    overlayEntry.remove();
  }

  static Future<void> showErrorToast(
      {required BuildContext context, required String message}) async {
    showBottomToastOverlay(
        context: context,
        message: message,
        backgroundColor: Theme.of(context).colorScheme.error);
  }
}
