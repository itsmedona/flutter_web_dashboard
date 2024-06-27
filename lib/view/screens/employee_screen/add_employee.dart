import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_application/core/animations/entrance_fader.dart';
import 'package:web_application/core/constants/color_constant.dart';
import 'package:web_application/core/constants/size_constants.dart';
import 'package:web_application/view/widgets/master_layout/master_layout.dart';
import 'package:web_application/view/widgets/sized_box.dart';

class AddEmployee extends StatelessWidget {
  const AddEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PortalMasterLayout(
      body: EntranceFader(
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 150,
                      color: AppColors.defaultColor.withOpacity(0.6),
                    ),
                    Align(
                      child: Container(
                        height: 100,
                        alignment: Alignment.centerLeft,
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        margin: EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                          color: AppColors.bgGreyColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage('assets/profile3.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            buildSizedboxW(kDefaultPadding),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add An Employee',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                buildSizedBoxH(kDefaultPadding * 3),
                screenSize.width >= kScreenWidthLg
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                          vertical: kDefaultPadding + kTextPadding,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(flex: 4, child: addEmployeeForm()),
                            buildSizedboxW(kDefaultPadding),
                          ],
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                          vertical: kDefaultPadding + kTextPadding,
                        ),
                        child: Column(
                          children: [
                            addEmployeeForm(),
                            buildSizedBoxH(kDefaultPadding),
                          ],
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget addEmployeeForm() {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.bgGreyColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Basic Information',
            style: GoogleFonts.montserrat(
              fontSize: kDefaultPadding + kTextPadding,
              fontWeight: FontWeight.bold,
            ),
          ),
          buildSizedBoxH(kDefaultPadding * 2),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  name: 'First Name',
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    hintText: 'Andrews',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  name: 'Last Name',
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'Xavier',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                ),
              ),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 3),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  name: 'Username',
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Username',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  name: 'Password',
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                ),
              ),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 3),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  name: 'Employee ID',
                  decoration: const InputDecoration(
                    labelText: 'Employee ID',
                    hintText: 'Employee ID',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  name: 'Biometric ID',
                  decoration: const InputDecoration(
                    labelText: 'Biometric ID',
                    hintText: 'Biometric ID',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                ),
              ),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 2),
          FormBuilderTextField(
            name: 'Company Name',
            decoration: const InputDecoration(
              labelText: 'Company Name',
              hintText: 'ABC Info Solutions',
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            enableSuggestions: false,
            validator: FormBuilderValidators.required(),
          ),
          buildSizedBoxH(kDefaultPadding * 3),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  name: 'Department',
                  decoration: const InputDecoration(
                    labelText: 'Department',
                    hintText: 'Sales',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.text,
                  validator: FormBuilderValidators.required(),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  name: 'Designation',
                  decoration: const InputDecoration(
                    labelText: 'Designation',
                    hintText: 'Designation',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.text,
                  validator: FormBuilderValidators.required(),
                ),
              ),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 3),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  name: 'Reporting To',
                  decoration: const InputDecoration(
                    labelText: 'Reporting to',
                    hintText: ' ',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.text,
                  validator: FormBuilderValidators.required(),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  name: 'User Type',
                  decoration: const InputDecoration(
                    labelText: 'User Type',
                    hintText: ' ',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.text,
                  validator: FormBuilderValidators.required(),
                ),
              ),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 3),
          Divider(
            indent: kDefaultPadding * 2,
            endIndent: kDefaultPadding * 2,
          ),
          buildSizedBoxH(kDefaultPadding * 3),
          Text(
            'Detailed Information',
            style: GoogleFonts.montserrat(
              fontSize: kDefaultPadding + kTextPadding,
              fontWeight: FontWeight.bold,
            ),
          ),
          buildSizedBoxH(kDefaultPadding * 2),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  name: 'Father Name',
                  decoration: const InputDecoration(
                    labelText: 'Father Name',
                    hintText: 'Father Name',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  name: 'Mother Name',
                  decoration: const InputDecoration(
                    labelText: 'Mother Name',
                    hintText: 'Mother Name',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                ),
              ),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 2),
          FormBuilderTextField(
            name: 'Address',
            decoration: const InputDecoration(
              labelText: 'Address',
              hintText: 'A-xyz test near test',
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            enableSuggestions: false,
            validator: FormBuilderValidators.required(),
          ),
          buildSizedBoxH(kDefaultPadding * 2),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  name: 'Date of Birth',
                  decoration: const InputDecoration(
                    labelText: 'Date of Birth',
                    hintText: 'dd/mm/yyyy',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  name: 'Phone Number',
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    hintText: '+91 9876543210',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                ),
              ),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 2),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  name: 'Joining Date',
                  decoration: const InputDecoration(
                    labelText: 'Joining Date',
                    hintText: '01/06/2024',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  name: 'Is Active',
                  decoration: const InputDecoration(
                    labelText: 'Is Active',
                    hintText: 'Yes/No',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
