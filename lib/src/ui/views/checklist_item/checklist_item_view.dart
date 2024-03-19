import 'package:flutter/material.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/ui/shared/colors.dart';
import 'package:interview_task/src/ui/shared/dimens.dart';
import 'package:interview_task/src/ui/shared/styles.dart';
import 'package:interview_task/src/ui/shared/ui_helpers.dart';
import 'package:interview_task/src/ui/widgets/loading.dart';
import 'package:stacked/stacked.dart';

import 'checklist_item_viewmodel.dart';

class ChecklistItemView extends StatelessWidget {
  final int checklistId;

  const ChecklistItemView({
    Key? key,
    required this.checklistId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<ChecklistItemViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          actions: [],
          title: Text(
            'Checklist Item',
            style: poppinsBlackSemiBoldTextStyle.copyWith(
              fontSize: headline5,
              color: Colors.white,
            ),
          ),
        ),
        body: Loading(
          status: vm.isBusy || vm.fetchingChecklist,
          child: SafeArea(
            child: Container(
              height: screenHeight(context),
              child: Column(
                children: [
                  verticalSpace(SDP.sdp(padding)),
                  if (vm.checkListItem.isEmpty || vm.checkListItem == [])
                    Container(
                      child: Center(
                        child: Text(
                          'Data Kosong',
                          style: poppinsBlackBoldTextStyle.copyWith(
                            fontSize: headline5,
                            color: BaseColors.black.withOpacity(0.2),
                          ),
                        ),
                      ),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: vm.checkListItem.length,
                      itemBuilder: (context, index) {
                        final item = vm.checkListItem[index];
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: SDP.sdp(12)),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(smallRadius),
                            ),
                            padding: EdgeInsets.all(SDP.sdp(6)),
                            child: Row(
                              children: [
                                Text('${index + 1}'),
                                horizontalSpace(SDP.sdp(space)),
                                Text(
                                  item.name ?? '',
                                  style: poppinsBlackRegularTextStyle.copyWith(
                                    fontSize: headline6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ChecklistItemViewModel(checkListId: checklistId),
    );
  }
}
