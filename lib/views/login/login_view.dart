import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:test_case/views/choose_country_code/choose_country_code_view.dart';
import 'login_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (BuildContext context, LoginViewModel viewModel, Widget _) {
        return Scaffold(
          body: _buildBody,
        );
      },
      onModelReady: (model) {
        viewModel = model;
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }

  Widget get _buildBody => Column(
        children: [
          SizedBox(height: 80.h),
          _buildLogo,
          SizedBox(height: 15.6.h),
          _buildTitle,
          SizedBox(height: 15.h),
          _buildSubTitle,
          SizedBox(height: 20.h),
          _buildTffs,
          SizedBox(height: 10.h),
          _buildInfoText,
          const Spacer(),
          _buildSmsButton,
          SizedBox(height: 10.h),
          _buildWpButton,
          SizedBox(height: 20.h),
          _buildPrivacyPolicy,
          SizedBox(height: 30.h),
        ],
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
        "Üye Girişi Yapın ya da Üyelik Oluşturun",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      );

  get _buildSubTitle => Text(
        "Giriş yapmak ya da üyelik oluşturmak için telefon numaranızı girin. Şifreye ihtiyacınız yok! Verileriniz tamamen güvende.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          height: 1.5,
          color: const Color(0xFF908E8E),
        ),
      );

  get _buildTffs => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          viewModel.selectedCountry != null
              ? InkWell(
                  onTap: () async {
                    var selectedCountry = await showDialog(
                        context: context,
                        builder: (context) {
                          return ChooseCountryCodeView();
                        });
                    if (selectedCountry != null) {
                      viewModel.selectedCountry = selectedCountry;
                      viewModel.notifyListeners();
                    }
                  },
                  child: SizedBox(
                    width: 90.w,
                    height: 47.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30.w,
                          height: 20.h,
                          child: Image.network(
                            viewModel.selectedCountry.flag,
                            width: 30.w,
                            height: 20.h,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          viewModel.selectedCountry.number,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : _buildTFF(
                  "Alan Kodu",
                  90,
                  47,
                  () async {
                    var selectedCountry = await showDialog(
                        context: context,
                        builder: (context) {
                          return ChooseCountryCodeView();
                        });
                    if (selectedCountry != null) {
                      viewModel.selectedCountry = selectedCountry;
                      viewModel.notifyListeners();
                    }
                  },
                ),
          SizedBox(width: 10.w),
          _buildTFF(
            "Cep Telefonu",
            255,
            47,
            () {},
          ),
        ],
      );

  Widget _buildTFF(
    String label,
    double width,
    double height,
    VoidCallback onPress,
  ) =>
      SizedBox(
        width: width.w,
        height: height.h,
        child: TextFormField(
          onTap: onPress,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 11.sp,
              color: const Color(0xFF908E8E),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFEDE8E9),
                width: 1.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFEDE8E9),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFEDE8E9),
                width: 1.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFEDE8E9),
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFEDE8E9),
                width: 1.0,
              ),
            ),
          ),
        ),
      );

  get _buildInfoText => Text(
        "Telefon numaranızı onaylamak için bir kod göndereceğiz.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.normal,
          color: const Color(0xFF908E8E),
        ),
      );

  get _buildSmsButton => Row(
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
                onPressed: () => viewModel.nextConfirmPage(),
                child: Wrap(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/svg/message.svg",
                      width: 20.w,
                      height: 20.h,
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      "SMS ile Kod Alın",
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  get _buildWpButton => Row(
        children: [
          Expanded(
            child: Container(
              height: 50.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextButton(
                style: TextButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () => viewModel.nextConfirmPage(),
                child: Wrap(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/svg/wp.svg",
                      width: 20.w,
                      height: 20.h,
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      "WhatsApp ile Kod Alın",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF006DFF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  get _buildPrivacyPolicy {
    var style1 = TextStyle(
      color: const Color(0xFF908E8E),
      fontSize: 14.sp,
      height: 1.5,
    );
    var style2 = TextStyle(
      color: const Color(0xFF006AFF),
      fontSize: 14.sp,
      decoration: TextDecoration.underline,
    );
    return SizedBox(
      width: 246.w,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(text: 'Devam ederek ', style: style1),
            TextSpan(text: 'Kullanım Koşullarını ', style: style2),
            TextSpan(text: 've ', style: style1),
            TextSpan(text: 'Gizlilik Politikasını ', style: style2),
            TextSpan(text: 'kabul etmiş olursunuz. ', style: style1),
          ],
        ),
      ),
    );
  }
}
