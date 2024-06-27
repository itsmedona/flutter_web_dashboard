import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:web_application/core/constants/color_constant.dart';
import 'package:web_application/core/constants/size_constants.dart';
import 'package:web_application/view/widgets/responsive.dart';
import 'package:web_application/view/widgets/routes.dart';
import 'package:web_application/view/widgets/sized_box.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/png/login.png",
                    width: screenWidth / 2,
                    height: screenHeight / 1.2,
                  ),
                ],
              ),
              buildSizedboxW(10),
              Container(
                height: screenHeight / 2,
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(maxWidth: screenWidth / 2.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: _buildForm(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(
                "assets/images/png/login.png",
                width: screenWidth,
                height: screenHeight / 3,
              ),
              buildSizedBoxH(20),
              Container(
                height: screenHeight / 2,
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(maxWidth: screenWidth - 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: _buildForm(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/png/login.png",
                  width: double.infinity,
                  height: screenHeight / 4,
                ),
                buildSizedBoxH(20),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: _buildForm(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w900,
                color: AppColors.blackColor,
              ),
            ),
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: AppColors.blackColor,
              ),
            ),
            buildSizedBoxH(20),
            Padding(
              padding: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
              child: FormBuilderTextField(
                name: 'username',
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                enableSuggestions: false,
                //validator: FormBuilderValidators.required(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: kDefaultPadding * 5.0),
              child: FormBuilderTextField(
                name: 'password',
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                enableSuggestions: false,
                obscureText: true,
                //validator: FormBuilderValidators.required(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: kDefaultPadding),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      Get.toNamed(Routes.DASHBOARD);
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: AppColors.buttonAltColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: kDefaultPadding),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: AppColors.blackColor),
                      ),
                      buildSizedboxW(kTextPadding),
                      const Text(
                        'Register now',
                        style: TextStyle(color: AppColors.buttonAltColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
