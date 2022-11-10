import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unit_test_app/core/di.dart';
import 'package:unit_test_app/core/resources/app_colors.dart';
import 'package:unit_test_app/core/resources/app_size.dart';
import 'package:unit_test_app/core/resources/app_strings.dart';
import 'package:unit_test_app/domain/usecase/request_otp_usecase.dart';
import 'package:unit_test_app/features/blocs/request_otp_bloc/request_otp_bloc.dart';

class RequestOtpView extends StatefulWidget {
  const RequestOtpView({Key? key}) : super(key: key);

  @override
  _RequestOtpViewState createState() => _RequestOtpViewState();
}

class _RequestOtpViewState extends State<RequestOtpView> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNoTextEditingController = TextEditingController();
  final _useCase = instance<RequestOtpUseCase>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RequestOtpBloc>(
      create: (context) => RequestOtpBloc(requestOtpUseCase: _useCase),
      child: BlocConsumer<RequestOtpBloc, RequestOtpState>(
          listener: (context, state) {
        if (state.requestOtpStatus == RequestOtpStatus.success) {
          print(state.requestOtp?.name ?? "No Name");
          //todo: Navigate to next screen
        } else if (state.requestOtpStatus == RequestOtpStatus.error) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(state.failure?.message ?? "Error"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }, builder: (context, state) {
        return state.requestOtpStatus == RequestOtpStatus.loading
            ? Container(
                color: Colors.white,
                child: Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      color: AppColors.darkOrange,
                    ),
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: Colors.white,
                body: _getContentWidget(context),
              );
      }),
    );
  }

  Widget _getContentWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.enterPhoneNo,
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            BlocBuilder<RequestOtpBloc, RequestOtpState>(
                                builder: (context, state) {
                              return TextFormField(
                                controller: _phoneNoTextEditingController,
                                keyboardType: TextInputType.phone,
                                onChanged: (value) {
                                  context.read<RequestOtpBloc>().add(
                                      PhoneNumberInputEvent(
                                          phoneNumber: value));
                                },
                                maxLength: 10,
                                decoration: InputDecoration(
                                  hintText: AppStrings.phoneNoHint,
                                  errorText: state.phoneNumberError,
                                ),
                              );
                            }),
                            Text(
                              AppStrings.otpSmsInst,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: AppSize.s55,
                              child: ElevatedButton(
                                  onPressed: () {
                                    context.read<RequestOtpBloc>().add(
                                        ContinueButtonPressedEvent(
                                            phoneNumber:
                                                _phoneNoTextEditingController
                                                    .text));
                                  },
                                  child: const Text(
                                    AppStrings.continueString,
                                  )),
                            ),
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  text: AppStrings.acceptTermsInst,
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: AppFontSize.f12),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: AppStrings.termsAndConditions,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            //todo: Send user to Terms & Condition
                                          },
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: AppFontSize.f14)),
                                    TextSpan(
                                        text: AppStrings.and,
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: AppFontSize.f12)),
                                    TextSpan(
                                        text: AppStrings.privacyPolicy,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            //todo: Navigate user to privacy policy
                                          },
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: AppFontSize.f14)),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
