import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'confirm_phone_number_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmPhoneNumberView extends StatefulWidget {
  @override
  State<ConfirmPhoneNumberView> createState() => _ConfirmPhoneNumberViewState();
}

class _ConfirmPhoneNumberViewState extends State<ConfirmPhoneNumberView> {
  ConfirmPhoneNumberViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ConfirmPhoneNumberViewModel>.reactive(
      builder: (BuildContext context, ConfirmPhoneNumberViewModel viewModel,
          Widget _) {
        return Scaffold(
          body: _buildBody,
        );
      },
      onModelReady: (model) {
        viewModel = model;
      },
      viewModelBuilder: () => ConfirmPhoneNumberViewModel(),
    );
  }

  Widget get _buildBody => Column(
        children: [
          SizedBox(height: 65.h),
          _buildLogo,
          SizedBox(height: 15.6.h),
          _buildTitle,
          SizedBox(height: 15.h),
          _buildSubTitle,
          SizedBox(height: 20.h),
          _buildNumbersTff,
          SizedBox(height: 20.h),
          _buildTimeText,
          SizedBox(height: 10.h),
          _buildSendAgainText,
          const Spacer(),
          _buildConfirmButton,
          SizedBox(height: 166.h),
        ],
      );

  Widget get _buildNumbersTff => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: PinCodeTextField(
          onChanged: (value) {},
          length: 6,
          appContext: context,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50.h,
            fieldWidth: 50.w,
            activeFillColor: Colors.white,
            activeColor: Colors.black,
            inactiveColor: const Color(0xFFEDE8E9),
            selectedColor: Colors.blue,
            inactiveFillColor: Colors.white,
            selectedFillColor: Colors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
        ),
      );

  get _buildSendAgainText => Text(
        "kodu almadım",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11.sp,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF006AFF),
        ),
      );

  get _buildLogo => SizedBox(
        width: 113.w,
        height: 22.4.h,
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/svg/home_logo.svg",
              width: 22.w,
              height: 22.h,
            ),
            SizedBox(width: 3.w),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'kiram',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF16B8F3),
                      fontSize: 15.sp,
                    ),
                  ),
                  TextSpan(
                    text: 'kolay',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF006AFF),
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  get _buildTitle => Text(
        "Telefonunuza gelen kodu girin",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      );

  get _buildSubTitle {
    var style1 = TextStyle(
      color: const Color(0xFF484848),
      fontSize: 14.sp,
      height: 1.5,
    );
    var style2 = TextStyle(
      color: const Color(0xFF908E8E),
      fontSize: 14.sp,
    );
    return SizedBox(
      width: 334.w,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(text: '+90xxxxxxxxxx ', style: style1),
            TextSpan(
                text: 'numarasına gönderdiğimiz  6 haneli kodu ',
                style: style2),
            TextSpan(text: 'giriniz.', style: style1),
          ],
        ),
      ),
    );
  }

  get _buildTimeText => Text(
        "02:00",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      );

  get _buildConfirmButton => Row(
        children: [
          Expanded(
            child: Container(
              height: 50.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF006DFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Onayla",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
