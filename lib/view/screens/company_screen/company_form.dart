import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_application/core/constants/size_constants.dart';
import 'package:web_application/view/widgets/sized_box.dart';

class CompanyFormWidget extends StatefulWidget {
  final TextEditingController companyIdController;
  final TextEditingController companyCodeController;
  final TextEditingController companyNameController;
  final TextEditingController industryController;
  final TextEditingController statusController;
  final TextEditingController groupNameController;
  final TextEditingController legalNameController;
  final TextEditingController founderController;
  final TextEditingController emailController;
  final TextEditingController panController;
  final TextEditingController whatsappController;
  final TextEditingController phoneNumberController;
  final TextEditingController addressController;
  final TextEditingController landmarkController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController countryController;
  CompanyFormWidget({
    super.key,
    required this.companyIdController,
    required this.companyCodeController,
    required this.companyNameController,
    required this.industryController,
    required this.statusController,
    required this.groupNameController,
    required this.legalNameController,
    required this.founderController,
    required this.emailController,
    required this.panController,
    required this.whatsappController,
    required this.phoneNumberController,
    required this.addressController,
    required this.landmarkController,
    required this.cityController,
    required this.stateController,
    required this.countryController,
  });

  @override
  State<CompanyFormWidget> createState() => _CompanyFormWidgetState();
}

class _CompanyFormWidgetState extends State<CompanyFormWidget> {
  bool isVATSelected = false;
  bool isGSTSelected = false;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      // key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.companyIdController,
                  name: 'Company ID',
                  decoration: InputDecoration(
                    labelText: 'Company ID',
                    hintText: 'Test.user',
                    // helperText: '* To test registration fail: admin',
                    border: const OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  validator: FormBuilderValidators.required(),
                  // onSaved: (value) => (_formData.username = value ?? ''),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.companyCodeController,
                  name: 'Company Code',
                  decoration: InputDecoration(
                    labelText: 'Company Code',
                    hintText: 'test@gmail.com',
                    border: const OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.required(),
                  // onSaved: (value) => (_formData.email = value ?? ''),
                ),
              ),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 3),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.companyNameController,
                  name: 'Company Name',
                  decoration: const InputDecoration(
                    labelText: 'Company Name',
                    hintText: 'Test',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                  // onSaved: (value) => (_formData.firstname = value ?? ''),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.industryController,
                  name: 'Industry/Category',
                  decoration: const InputDecoration(
                    labelText: 'Industry/Category',
                    hintText: 'User',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                  //  onSaved: (value) => (_formData.lastname = value ?? ''),
                ),
              ),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 3),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.statusController,
                  name: 'Status',
                  decoration: const InputDecoration(
                    labelText: 'Status',
                    hintText: 'Test',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                  // onSaved: (value) => (_formData.firstname = value ?? ''),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.groupNameController,
                  name: 'Group Name',
                  decoration: const InputDecoration(
                    labelText: 'Group Name',
                    hintText: 'User',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                  //  onSaved: (value) => (_formData.lastname = value ?? ''),
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
          Text('Detailed Information',
              style: GoogleFonts.montserrat(
                  fontSize: kDefaultPadding + kTextPadding,
                  fontWeight: FontWeight.bold)),
          buildSizedBoxH(kDefaultPadding * 2),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.legalNameController,
                  name: 'Legal Name',
                  decoration: const InputDecoration(
                    labelText: 'Legal Name',
                    hintText: 'Fredy',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                  // onSaved: (value) => (_formData.firstname = value ?? ''),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.founderController,
                  name: 'Founder/owner',
                  decoration: const InputDecoration(
                    labelText: 'Founder/owner',
                    hintText: 'Founder/owner',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                  //  onSaved: (value) => (_formData.lastname = value ?? ''),
                ),
              ),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 2),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.emailController,
                  name: 'E-mail',
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'abc@gmail.com',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                  // onSaved: (value) => (_formData.firstname = value ?? ''),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.panController,
                  name: 'Pan',
                  decoration: const InputDecoration(
                    labelText: 'Pan',
                    hintText: 'Pan',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                  //  onSaved: (value) => (_formData.lastname = value ?? ''),
                ),
              ),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 2),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.whatsappController,
                  name: 'Whatsapp',
                  decoration: const InputDecoration(
                    labelText: 'Whatsapp',
                    hintText: 'Whatsapp',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                  // onSaved: (value) => (_formData.firstname = value ?? ''),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.phoneNumberController,
                  name: 'Phone number',
                  decoration: const InputDecoration(
                    labelText: 'Phone number',
                    hintText: 'Phone number',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.required(),
                  //  onSaved: (value) => (_formData.lastname = value ?? ''),
                ),
              ),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 2),
          FormBuilderTextField(
            controller: widget.addressController,
            name: 'Address',
            decoration: const InputDecoration(
              labelText: 'Address',
              hintText: 'A-xyz test near test',
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            enableSuggestions: false,
            validator: FormBuilderValidators.required(),
            // onSaved: (value) => (_formData.address = value ?? ''),
          ),
          buildSizedBoxH(kDefaultPadding * 2),
          FormBuilderTextField(
            controller: widget.landmarkController,
            name: 'Landmark',
            decoration: const InputDecoration(
              labelText: 'Landmark',
              hintText: 'Landmark',
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            enableSuggestions: false,
            validator: FormBuilderValidators.required(),
            // onSaved: (value) => (_formData.address = value ?? ''),
          ),
          buildSizedBoxH(kDefaultPadding * 3),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.cityController,
                  name: 'City',
                  decoration: const InputDecoration(
                    labelText: 'City',
                    hintText: 'Surat',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  keyboardType: TextInputType.text,
                  validator: FormBuilderValidators.required(),
                  // onSaved: (value) => (_formData.city = value ?? '')
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.stateController,
                  name: 'State',
                  decoration: const InputDecoration(
                    labelText: 'State',
                    hintText: 'Kerala',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.text,
                  validator: FormBuilderValidators.required(),
                  // onSaved: (value) => (_formData.country = value ?? ''),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 3),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  controller: widget.countryController,
                  name: 'Country',
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    hintText: 'India',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  keyboardType: TextInputType.text,
                  validator: FormBuilderValidators.required(),
                  // onSaved: (value) => (_formData.country = value ?? ''),
                ),
              ),
            ],
          ),
          buildSizedBoxH(kDefaultPadding * 3),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'VAT/GST Applicable',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Expanded(
                flex: 1,
                child: FormBuilderCheckbox(
                  name: 'VAT',
                  initialValue: isVATSelected,
                  title: const Text('VAT'),
                  onChanged: (value) {
                    setState(() {
                      isVATSelected = value ?? false;
                    });
                  },
                ),
              ),
              buildSizedboxW(kDefaultPadding),
              Expanded(
                flex: 1,
                child: FormBuilderCheckbox(
                  name: 'GST',
                  initialValue: isGSTSelected,
                  title: const Text('GST'),
                  onChanged: (value) {
                    setState(() {
                      isGSTSelected = value ?? false;
                    });
                  },
                ),
              ),
            ],
          ),
          if (isVATSelected)
            Row(
              children: [
                Flexible(
                  child: FormBuilderTextField(
                    // controller: widget.,
                    name: 'VAT Number',
                    decoration: const InputDecoration(
                      labelText: 'VAT Number',
                      hintText: 'VAT Number',
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
                    name: 'VAT Rate',
                    decoration: const InputDecoration(
                      labelText: 'VAT Rate',
                      hintText: 'VAT Rate',
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
          if (isGSTSelected)
            Row(
              children: [
                Flexible(
                  child: FormBuilderTextField(
                    name: 'GST Number',
                    decoration: const InputDecoration(
                      labelText: 'GST Number',
                      hintText: 'GST Number',
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
                    name: 'GST Compounding',
                    decoration: const InputDecoration(
                      labelText: 'GST Compounding',
                      hintText: 'GST Compounding',
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    keyboardType: TextInputType.name,
                    validator: FormBuilderValidators.required(),
                  ),
                ),
              ],
            ),
          buildSizedboxW(kDefaultPadding)
        ],
      ),
    );
  }
}
