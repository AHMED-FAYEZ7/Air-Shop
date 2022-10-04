
import 'package:air_shop/presentation/resources/assets_manager.dart';
import 'package:air_shop/presentation/resources/color_manager.dart';
import 'package:air_shop/presentation/resources/font_manager.dart';
import 'package:air_shop/presentation/resources/strings_manager.dart';
import 'package:air_shop/presentation/resources/styles_manager.dart';
import 'package:air_shop/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


Widget getFullScreenLoadingState(){
  return getItemsInColumn(
      [getAnimatedImage(JsonAssets.loading), getMessage(AppStrings.loading)]);
}

// Widget getFullScreenErrorState(){
//   return getItemsInColumn([
//     getAnimatedImage(JsonAssets.error),
//     getMessage(message),
//     getRetryButton(AppStrings.retryAgain, context)
//   ]);
// }

Widget getPopUpDialog(BuildContext context, List<Widget> children) {
  return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14)),
    elevation: AppSize.s1_5,
    backgroundColor: Colors.transparent,
    child: Container(
      decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.s14),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                blurRadius: AppSize.s12,
                offset: Offset(AppSize.s0, AppSize.s12))
          ]),
      child: getDialogContent(context, children),
    ),
  );
}

Widget getDialogContent(BuildContext context, List<Widget> children) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: children,
  );
}

Widget getAnimatedImage(String animationName) {
  return SizedBox(
    height: AppSize.s100,
    width: AppSize.s100,
    child: Lottie.asset(animationName),
  );
}

Widget getMessage(String message) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(AppPadding.p18),
      child: Text(
        message,
        style:
        getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
      ),
    ),
  );
}

Widget getRetryButton(String buttonTitle, BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(AppPadding.p18),
      child: SizedBox(
        width: AppSize.s180,
        child: ElevatedButton(
            onPressed: () {
              // if (stateRendererType ==
              //     StateRendererTypeWidgets.FULL_SCREEN_ERROR_STATE) {
              //   retryActionFunction
              //       ?.call(); // to call the API function again to retry
              // } else {
              //   Navigator.of(context)
              //       .pop(); // popup state error so we need to dismiss the dialog
              // }
            },
            child: Text(buttonTitle)),
      ),
    ),
  );
}

Widget getItemsInColumn(List<Widget> children) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    ),
  );
}