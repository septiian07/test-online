import 'package:flutter/material.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/ui/shared/colors.dart';
import 'package:interview_task/src/ui/shared/dimens.dart';
import 'package:interview_task/src/ui/shared/styles.dart';
import 'package:interview_task/src/ui/shared/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';

import 'chip.dart';

class ConfirmationDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ConfirmationDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: SDP.sdp(padding),
          horizontal: SDP.sdp(smallPadding),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SDP.sdp(8.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              request.title!,
              style: poppinsBlackSemiBoldTextStyle.copyWith(
                fontSize: headline5,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(SDP.sdp(smallPadding)),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: KChip(
                    onPressed: () =>
                        completer(DialogResponse(confirmed: false)),
                    border: Border.all(
                      color: BaseColors.primary,
                      width: SDP.sdp(1.0),
                    ),
                    borderRadius: BorderRadius.circular(
                      SDP.sdp(smallRadius),
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: SDP.sdp(9.0)),
                    child: Center(
                      child: Text(
                        request.secondaryButtonTitle ?? '',
                        style: poppinsBlackSemiBoldTextStyle.copyWith(
                          fontSize: SDP.sdp(headline6),
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(SDP.sdp(smallPadding)),
                Expanded(
                  flex: 1,
                  child: KChip(
                    onPressed: () => completer(DialogResponse(confirmed: true)),
                    border: Border.all(
                      color: BaseColors.primary,
                      width: SDP.sdp(1.0),
                    ),
                    borderRadius: BorderRadius.circular(
                      SDP.sdp(smallRadius),
                    ),
                    color: BaseColors.primary,
                    padding: EdgeInsets.symmetric(vertical: SDP.sdp(9.0)),
                    child: Center(
                      child: Text(
                        request.mainButtonTitle ?? '',
                        style: poppinsBlackSemiBoldTextStyle.copyWith(
                          fontSize: SDP.sdp(headline6),
                          color: BaseColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
