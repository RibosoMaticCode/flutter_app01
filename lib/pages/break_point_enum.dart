enum BreakPointEnum {
  Desktop,
  Tablet,
  Mobile,
}

extension BreakPointEnumExtension on BreakPointEnum {
  double? get value {
    if (this == BreakPointEnum.Desktop) return 960.0;
    if (this == BreakPointEnum.Tablet) return 768.0;
    if (this == BreakPointEnum.Mobile) return 768.0;
    return null;
  }

  String? get description {
    if (this == BreakPointEnum.Desktop) return 'crash on 995.0';
    if (this == BreakPointEnum.Tablet) return 'crash on 580.0';
    if (this == BreakPointEnum.Mobile) return 'crash on 720.0';
    return null;
  }
}
