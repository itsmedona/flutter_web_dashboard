import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_application/core/animations/entrance_fader.dart';
import 'package:web_application/core/constants/color_constant.dart';
import 'package:web_application/core/constants/size_constants.dart';
import 'package:web_application/view/widgets/master_layout/master_layout.dart';
import 'package:web_application/view/widgets/sized_box.dart';

class EditCompany extends StatefulWidget {
  const EditCompany({super.key});

  @override
  _EditCompanyState createState() => _EditCompanyState();
}

class _EditCompanyState extends State<EditCompany> {
  bool isVatApplicable = false;
  bool isGstApplicable = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return PortalMasterLayout(
      body: EntranceFader(
        child: ListView(
          children: [
            Column(
              children: [
                _buildHeader(),
                buildSizedBoxH(kDefaultPadding * 3),
                _buildForm(screenSize),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
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
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                    image: const DecorationImage(
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
                      'Edit Company',
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
    );
  }

  Widget _buildForm(Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding + kTextPadding,
      ),
      child: screenSize.width >= kScreenWidthLg
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(flex: 4, child: _buildFormFields()),
                buildSizedboxW(kDefaultPadding),
              ],
            )
          : Column(
              children: [
                _buildFormFields(),
                buildSizedBoxH(kDefaultPadding),
              ],
            ),
    );
  }

  Widget _buildFormFields() {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.bgGreyColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('BASIC INFORMATION'),
          _buildFormFieldSpacing(),
          _buildBasicInfoFields(),
          _buildDividerWithSpacing(),
          _buildSectionTitle('DETAILED INFORMATION'),
          _buildFormFieldSpacing(),
          _buildDetailedInfoFields(),
          _buildDividerWithSpacing(),
          _buildSectionTitle('ACCOUNTING INFORMATION'),
          _buildFormFieldSpacing(),
          _buildAccountingInfoFields(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontSize: kDefaultPadding + kTextPadding,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildFormFieldSpacing() {
    return Column(
      children: [
        buildSizedBoxH(kDefaultPadding),
        buildSizedBoxH(kDefaultPadding * 2),
      ],
    );
  }

  Widget _buildDividerWithSpacing() {
    return Column(
      children: [
        Divider(indent: kDefaultPadding * 2, endIndent: kDefaultPadding * 2),
        buildSizedBoxH(kDefaultPadding * 3),
      ],
    );
  }

  Widget _buildBasicInfoFields() {
    return FormBuilder(
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTwoFormFields(
            _buildTextField('Company ID', 'Company ID', 'Test.user'),
            _buildTextField(
              'Company code',
              'Company code',
              'Test@gmail.com',
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          _buildFormFieldSpacing(),
          _buildTwoFormFields(
            _buildTextField('Company Name', 'Company Name', 'Test'),
            _buildTextField(
              'Industry/Category',
              'Industry/Category',
              'User',
            ),
          ),
          _buildFormFieldSpacing(),
          _buildTwoFormFields(
            _buildTextField('Status', 'Status', 'Test'),
            _buildTextField(
              'Group Name',
              'Group Name',
              'User',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedInfoFields() {
    return FormBuilder(
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTwoFormFields(
            _buildTextField('Legal name', 'Legal name', 'Legal name'),
            _buildTextField(
              'Founder/Owner',
              'Founder/Owner',
              'Founder/Owner',
            ),
          ),
          _buildFormFieldSpacing(),
          _buildTwoFormFields(
            _buildTextField('Email', 'Email', 'Email'),
            _buildTextField('Pan', 'Pan', 'Pan'),
          ),
          _buildFormFieldSpacing(),
          _buildTwoFormFields(
            _buildTextField('Whatsapp', 'Whatsapp', 'Whatsapp'),
            _buildTextField('Phone Number', 'Phone Number', 'Phone Number'),
          ),
          _buildFormFieldSpacing(),
          _buildTextField(
            'Address',
            'Address',
            'A-xyz test near test',
          ),
          _buildFormFieldSpacing(),
          _buildTextField('Landmark', 'Landmark', 'Landmark'),
          _buildFormFieldSpacing(),
          _buildTwoFormFields(
            _buildTextField('City', 'City', 'Surat'),
            _buildTextField('State', 'State', 'State'),
          ),
          _buildFormFieldSpacing(),
          _buildTextField('Country', 'Country', 'Country'),
        ],
      ),
    );
  }

  Widget _buildAccountingInfoFields() {
    return FormBuilder(
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: FormBuilderCheckbox(
                  name: 'VAT Applicable',
                  title: const Text('VAT Applicable'),
                  onChanged: (value) {
                    setState(() {
                      isVatApplicable = value ?? false;
                    });
                  },
                ),
              ),
              Flexible(
                child: FormBuilderCheckbox(
                  name: 'GST Applicable',
                  title: const Text('GST Applicable'),
                  onChanged: (value) {
                    setState(() {
                      isGstApplicable = value ?? false;
                    });
                  },
                ),
              ),
            ],
          ),
          if (isVatApplicable) ...[
            _buildFormFieldSpacing(),
            _buildTextField(
              'VAT number',
              'VAT number',
              'VAT number',
            ),
            _buildTextField('VAT rate', 'VAT rate', 'VAT rate')
          ],
          _buildFormFieldSpacing(),
          if (isGstApplicable) ...[
            _buildTwoFormFields(
              _buildTextField(
                'GST Compounding',
                'GST Compounding',
                'GST Compounding',
              ),
              _buildTextField(
                'GST number',
                'GST number',
                'GST number',
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTwoFormFields(Widget field1, Widget field2) {
    return Row(
      children: [
        Flexible(child: field1),
        buildSizedboxW(kDefaultPadding),
        Flexible(child: field2),
      ],
    );
  }

  Widget _buildTextField(
    String name,
    String labelText,
    String hintText, {
    TextInputType keyboardType = TextInputType.name,
  }) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      enableSuggestions: false,
      keyboardType: keyboardType,
      validator: FormBuilderValidators.required(),
    );
  }
}
