import 'package:flutter/material.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/helpers/validator/validator.dart';
import 'package:interview_task/src/ui/shared/colors.dart';
import 'package:interview_task/src/ui/shared/dimens.dart';
import 'package:interview_task/src/ui/shared/styles.dart';
import 'package:interview_task/src/ui/shared/ui_helpers.dart';
import 'package:interview_task/src/ui/widgets/chip.dart';
import 'package:interview_task/src/ui/widgets/loading.dart';
import 'package:interview_task/src/ui/widgets/textfield.dart';
import 'package:stacked/stacked.dart';

import 'create_checklist_viewmodel.dart';

class CreateChecklistView extends StatelessWidget {
  const CreateChecklistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<CreateChecklistViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          actions: [],
          title: Text(
            'Create Checklist',
            style: poppinsBlackSemiBoldTextStyle.copyWith(
              fontSize: headline5,
              color: Colors.white,
            ),
          ),
        ),
        body: Loading(
          status: vm.isBusy,
          child: SafeArea(
            child: Container(
              height: screenHeight(context),
              padding: EdgeInsets.symmetric(
                horizontal: SDP.sdp(smallPadding),
              ),
              child: Column(
                children: [
                  verticalSpace(SDP.sdp(padding)),
                  KTextField(
                    isDense: true,
                    maxLines: 1,
                    borderRadius: SDP.sdp(textfieldRadius),
                    controller: vm.nameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    borderColor: BaseColors.black.withOpacity(0.5),
                    placeholder: 'Name',
                    placeholderStyle: interBlackRegularTextStyle.copyWith(
                      fontSize: SDP.sdp(headline6),
                      color: BaseColors.hint,
                    ),
                    validator: Validator.requiredValidator,
                  ),
                  verticalSpace(SDP.sdp(40)),
                  SizedBox(
                    width: screenWidthPercentage(context, percentage: 0.7),
                    child: KChip(
                      isLoading: vm.isBusy,
                      isDisabled: vm.isBusy,
                      padding: EdgeInsets.symmetric(
                        vertical: SDP.sdp(16.0),
                      ),
                      loadingColor: Colors.white,
                      borderRadius: BorderRadius.circular(
                        SDP.sdp(radius),
                      ),
                      color: BaseColors.primary,
                      child: Center(
                        child: Text(
                          'Create',
                          style: interBlackRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(headline5),
                            color: BaseColors.white,
                          ),
                        ),
                      ),
                      onPressed: () => vm.createChecklist(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => CreateChecklistViewModel(),
    );
  }
}
