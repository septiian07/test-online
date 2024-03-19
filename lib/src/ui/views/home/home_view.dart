import 'package:flutter/material.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/ui/shared/colors.dart';
import 'package:interview_task/src/ui/shared/dimens.dart';
import 'package:interview_task/src/ui/shared/styles.dart';
import 'package:interview_task/src/ui/shared/ui_helpers.dart';
import 'package:interview_task/src/ui/widgets/loading.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          actions: [
            InkWell(
              onTap: vm.create,
              child: Padding(
                padding: EdgeInsets.only(right: SDP.sdp(6)),
                child: Icon(Icons.add_circle_outline_sharp,
                    semanticLabel: 'Create'),
              ),
            ),
          ],
          title: Text(
            'Checklist',
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
                  if (vm.checkList.isEmpty || vm.checkList == [])
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
                      itemCount: vm.checkList.length,
                      itemBuilder: (context, index) {
                        final item = vm.checkList[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SDP.sdp(12), vertical: SDP.sdp(4)),
                          child: InkWell(
                            onTap: () => vm.checklistItem(item.id ?? 0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius:
                                    BorderRadius.circular(smallRadius),
                              ),
                              padding: EdgeInsets.all(SDP.sdp(6)),
                              child: Row(
                                children: [
                                  Container(
                                    width: SDP.sdp(20),
                                    child: Text('${index + 1}'),
                                  ),
                                  horizontalSpace(SDP.sdp(space)),
                                  Container(
                                    width: screenWidthPercentage(context,
                                        percentage: 0.8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item.name ?? '',
                                          style: poppinsBlackRegularTextStyle
                                              .copyWith(
                                            fontSize: headline6,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await vm
                                                .deleteChecklist(item.id ?? 0);
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            size: SDP.sdp(20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
