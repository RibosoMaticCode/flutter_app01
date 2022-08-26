import 'package:flutter_app01/pages/break_point_enum.dart';

class BreakPointScreenHelper {
  double width;
  bool? isDesktop;
  bool? isTablet;
  bool? isMobile;
  double? widthFactor;

  BreakPointScreenHelper(this.width) {
    width = width;
    isDesktop = isOnDesktop();
    isTablet = isOnTable();
    isMobile = isOnMobile();
    widthFactor = getWidthFactor();
  }

  bool isOnDesktop() {
    return (width >= BreakPointEnum.Desktop.value!);
  }

  bool isOnTable() {
    return (width >= BreakPointEnum.Tablet.value! &&
        width <= BreakPointEnum.Desktop.value!);
  }

  bool isOnMobile() {
    return width <= BreakPointEnum.Mobile.value!;
  }

  double getWidthFactor() {
    // para desktop se define como max width 1320px
    if (width >= 1400) {
      return 1320 / width;
    }
    return 0.9;
  }
}
