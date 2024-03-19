import 'package:flutter/material.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/helpers/validator/validator.dart';
import 'package:interview_task/src/ui/shared/colors.dart';
import 'package:interview_task/src/ui/shared/dimens.dart';
import 'package:interview_task/src/ui/shared/styles.dart';
import 'package:interview_task/src/ui/shared/ui_helpers.dart';
import 'package:interview_task/src/ui/widgets/chip.dart';
import 'package:interview_task/src/ui/widgets/textfield.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.secondary,
        body: Container(
          width: screenWidth(context),
          height: screenHeight(context),
          padding: EdgeInsets.symmetric(
            vertical: SDP.sdp(bigPadding),
            horizontal: SDP.sdp(smallPadding),
          ),
          decoration: BoxDecoration(
            boxShadow: [shadow],
            color: BaseColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(SDP.sdp(radius)),
              topLeft: Radius.circular(SDP.sdp(radius)),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: interBlackBoldTextStyle.copyWith(
                      fontSize: SDP.sdp(headline2),
                    ),
                  ),
                  verticalSpace(SDP.sdp(bigSpace * 2)),
                  Form(
                    key: vm.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KTextField(
                          isDense: true,
                          maxLines: 1,
                          borderRadius: SDP.sdp(textfieldRadius),
                          controller: vm.usernameController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          borderColor: BaseColors.brown,
                          placeholder: 'Username',
                          placeholderStyle: interBlackRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(headline5),
                            color: BaseColors.hint,
                          ),
                          validator: Validator.requiredValidator,
                        ),
                        verticalSpace(SDP.sdp(space)),
                        KTextField(
                          isDense: true,
                          maxLines: 1,
                          borderRadius: SDP.sdp(textfieldRadius),
                          textInputAction: TextInputAction.go,
                          controller: vm.passwordController,
                          borderColor: BaseColors.brown,
                          placeholder: 'Password',
                          onFieldSubmitted: (val) => vm.validate(),
                          placeholderStyle: interBlackRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(headline5),
                            color: BaseColors.hint,
                          ),
                          suffixIcon: IconButton(
                            padding: EdgeInsets.only(right: SDP.sdp(20)),
                            onPressed: () {
                              setState(() {
                                vm.obscure = !vm.obscure;
                              });
                            },
                            icon: vm.obscure
                                ? Icon(
                                    Icons.remove_red_eye,
                                    size: SDP.sdp(20.0),
                                    color: BaseColors.primary,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    size: SDP.sdp(20.0),
                                    color: BaseColors.primary,
                                  ),
                          ),
                          obscure: vm.obscure,
                          validator: Validator.passwordValidator,
                        ),
                      ],
                    ),
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
                          'Login',
                          style: interBlackRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(headline5),
                            color: BaseColors.white,
                          ),
                        ),
                      ),
                      onPressed: () => vm.validate(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create your free account',
                    style: interBlackRegularTextStyle.copyWith(
                      fontSize: SDP.sdp(headline55),
                    ),
                  ),
                  InkWell(
                    onTap: vm.toSignUp,
                    child: Text(
                      ' Sign Up',
                      style: interPrimaryRegularTextStyle.copyWith(
                        fontSize: SDP.sdp(headline55),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
