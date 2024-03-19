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

import 'sign_up_viewmodel.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<SignUpViewModel>.nonReactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.secondary,
        body: Loading(
          status: vm.isBusy,
          child: Container(
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
                      'Sign Up',
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
                            controller: vm.emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            borderColor: BaseColors.brown,
                            placeholder: 'Email',
                            placeholderStyle: interBlackRegularTextStyle.copyWith(
                              fontSize: SDP.sdp(headline5),
                              color: BaseColors.hint,
                            ),
                            validator: Validator.emailValidator,
                          ),
                          verticalSpace(SDP.sdp(space)),
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
                            onFieldSubmitted: (val) => vm.toLogin(),
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
                          horizontal: SDP.sdp(space),
                        ),
                        loadingColor: Colors.white,
                        borderRadius: BorderRadius.circular(
                          SDP.sdp(radius),
                        ),
                        color: BaseColors.primary,
                        child: Center(
                          child: Text(
                            'Register',
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
                      'Already have an account?',
                      style: interBlackRegularTextStyle.copyWith(
                        fontSize: SDP.sdp(headline55),
                      ),
                    ),
                    InkWell(
                      onTap: vm.toLogin,
                      child: Text(
                        ' Login',
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
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
