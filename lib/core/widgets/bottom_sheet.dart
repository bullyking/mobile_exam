import 'package:flutter/material.dart';

Future<dynamic> onShowBottomSheetOnePage(
  BuildContext context,
  Widget widget, {
  ShapeBorder? shape,
  bool enableDrag = true,
}) async {
  final modalBottom = await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    shape: shape,
    builder: (context) => widget,
    enableDrag: enableDrag,
  );
  if (modalBottom != null) {
    return modalBottom;
  }
}
