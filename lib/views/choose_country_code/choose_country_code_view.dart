import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'choose_country_code_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseCountryCodeView extends StatefulWidget {
  @override
  State<ChooseCountryCodeView> createState() => _ChooseCountryCodeViewState();
}

class _ChooseCountryCodeViewState extends State<ChooseCountryCodeView> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChooseCountryCodeViewModel>.reactive(
      builder: (
        BuildContext context,
        ChooseCountryCodeViewModel viewModel,
        Widget _,
      ) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(20.w),
          contentPadding: EdgeInsets.only(
            top: 15.h,
            bottom: 15.h,
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCloseIconAndTitle,
                SizedBox(height: 30.h),
                _buildTFF(
                  "Ülke adı veya kod ile arama yapın",
                  305.w,
                  40.h,
                  () {},
                ),
                SizedBox(height: 30.h),
                _buildCountries(viewModel),
              ],
            ),
          ),
        );
      },
      onModelReady: (model) {
        model.loadCountries();
      },
      viewModelBuilder: () => ChooseCountryCodeViewModel(),
    );
  }

  Widget _buildCountries(ChooseCountryCodeViewModel _viewModel) => Container(
        margin: EdgeInsets.only(left: 15.w),
        height: 460.h,
        width: 150.w,
        child: RawScrollbar(
          controller: controller,
          isAlwaysShown: true,
          thumbColor: const Color(0xFF3A3335).withOpacity(.3),
          child: ListView.separated(
            controller: controller,
            padding: EdgeInsets.only(right: 15.w),
            itemBuilder: (context, index) => _buildItem(index, _viewModel),
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemCount: _viewModel.countries.length,
          ),
        ),
      );

  Widget _buildTFF(
    String label,
    double width,
    double height,
    VoidCallback onPress,
  ) =>
      Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        width: width.w,
        height: height.h,
        child: TextFormField(
          onTap: onPress,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: const Color(0xFF3A3335).withOpacity(.2),
              size: 28.sp,
            ),
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF3A3335).withOpacity(.4),
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

  Widget get _buildCloseIconAndTitle => Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF006AFF).withOpacity(.3),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 10.sp,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              "Ülkenizi Seçin",
              style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xFF484848),
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );

  _buildItem(int index, ChooseCountryCodeViewModel viewModel) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, viewModel.countries[index]);
      },
      child: Row(
        children: [
          SizedBox(
            width: 45.w,
            child: Text(
              viewModel.countries[index].number,
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(width: 56.w),
          Text(
            viewModel.countries[index].name,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 30.w,
            height: 20.h,
            child: Image.network(
              viewModel.countries[index].flag,
              width: 30.w,
              height: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}
