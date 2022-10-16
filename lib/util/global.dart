import 'package:shop_ui/widgets/custom_alertdialog.dart';
import 'package:flutter/material.dart';

Future<void> customAlert(context, imgUrl, titleButton, description) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CustomShopAlertDialogWithImage(
        imgUrl: imgUrl,
        titleButton: titleButton,
        description: description,
      );
    },
  );
}

Future<void> onAddToCart(
    context, midIcon, bottomRightIcon, title, subTitle, buttonTitle) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CustomAlertDialogWithIcon(
        height: 430,
        width: 400,
        circleBackgroundColor: Colors.grey[100],
        circleAfterBackgroundColor: Theme.of(context).buttonColor,
        midIcon: midIcon,
        bottomRightIcon: bottomRightIcon,
        title: title,
        subTitle: subTitle,
        buttonTitle: buttonTitle,
      );
    },
  );
}
