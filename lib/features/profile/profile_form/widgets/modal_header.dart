import 'package:flutter/material.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';
import 'package:mobile_exam/core/widgets/button/app_button.dart';

class ModalHeader extends StatelessWidget {
  const ModalHeader({Key? key, required this.title, this.closeAction, this.rightPadding}) : super(key: key);

  final String title;
  final VoidCallback? closeAction;
  final double? rightPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppTheme.color.whiteColor,
        padding: EdgeInsets.only(left: 16, right: rightPadding ?? 16, bottom: 5),
        child: Stack(
          children: <Widget>[
            TitleModal(
              title: title,
            ),
            CloseButtonModal(
              onPress: () {
                if (closeAction != null) {
                  closeAction!();
                }
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
}

// หัวข้อ (title modal)
class TitleModal extends StatelessWidget {
  const TitleModal({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Container(
          margin: const EdgeInsets.only(top: (AppTheme.sizeS / 2) - 4),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTheme.font.mitrS24,
          ),
        ),
      ),
    );
  }
}

// ปุ่มปิดขวาบน (close button modal)
class CloseButtonModal extends StatelessWidget {
  const CloseButtonModal({Key? key, required this.onPress}) : super(key: key);

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: Icon(
            Icons.close,
            color: AppTheme.color.primaryBlackColor,
            size: 24,
          ),
          onPressed: () {
            onPress.call();
          },
        ));
  }
}
