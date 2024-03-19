import 'package:flutter/material.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/ui/shared/styles.dart';
import 'package:stacked/stacked.dart';

import 'splash_screen_viewmodel.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<SplashScreenViewModel>.nonReactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                child: Text(
                  'Welcome',
                  style: poppinsBlackSemiBoldTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: Container(
                child: Text(
                  'To Application',
                  style: poppinsBlackSemiBoldTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
      viewModelBuilder: () => SplashScreenViewModel(),
    );
  }
}
