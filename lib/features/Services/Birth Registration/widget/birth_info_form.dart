import 'package:e_woda/Common/radio_button.dart';
import 'package:e_woda/core/contants/appstring_en.dart';
import 'package:e_woda/core/extension/date_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Common/appbar.dart';
import '../../../../Common/button.dart';
import '../../../../Common/datetime_picker.dart';
import '../../../../Common/divider.dart';
import '../../../../Common/dropdown_formfield.dart';
import '../../../../Common/text_form_field.dart';
import '../../../../core/resources/colors.dart';
import '../../../../provider/loading_provider.dart';
import '../../../pdf_generator/birth_form/birth_pdf_generator.dart';

class BirthInfoForm extends StatefulWidget {
  const BirthInfoForm({super.key});

  @override
  State<BirthInfoForm> createState() => _BirthInfoFormState();
}

class _BirthInfoFormState extends State<BirthInfoForm> {
  late final TextEditingController zoneController;
  late final TextEditingController districtController;
  late final TextEditingController gaPaNaController;

  late final TextEditingController wadaController;
  late final TextEditingController nameOfLocalRegController;
  late final TextEditingController employeeRefController;
  late final TextEditingController regController;

  late final TextEditingController bsFormRefDateController;
  late final TextEditingController adFormRefDateController;
  late final TextEditingController familyFormRegnoController;

  late final TextEditingController nameController;
  late final TextEditingController surnameController;
  late final TextEditingController bsBabyDOBController;
  late final TextEditingController adBabyDOBController;
  late final TextEditingController castController;
  late final TextEditingController physicalDeformityController;
  late final TextEditingController babyDistrictController;
  late final TextEditingController babyGaPaController;
  late final TextEditingController babyWadaController;
  late final TextEditingController abroadAddressController;
  late final TextEditingController grandParentFirstName;
  late final TextEditingController grandParentSurName;
  late final TextEditingController fatherFirstName;
  late final TextEditingController fatherSurName;
  late final TextEditingController motherFirstName;
  late final TextEditingController motherSurName;
  //ss
  late final TextEditingController sadakMarg;
  late final TextEditingController gauTol;
  late final TextEditingController houseNumber;

  final PDFGenerator pdfGenerator = PDFGenerator();

  final formKey = GlobalKey<FormState>();
  Deformity deformity = Deformity.no;

  List<String> birthSite = [
    AppString.hospital,
    AppString.home,
    AppString.healthInstitution,
    AppString.other
  ];
  List<String> helpBy = [
    AppString.manofthehouse,
    AppString.sudini,
    AppString.nurse,
    AppString.doctor,
    AppString.other
  ];
  List<String> birthType = [
    AppString.single,
    AppString.twins,
    AppString.triplet,
    AppString.morethanThript,
  ];

  List<String> gender = [AppString.male, AppString.female, AppString.other];

  String birthSiteValue = AppString.hospital;
  String genderValue = AppString.male;
  String helpByValue = AppString.nurse;
  String birthTypeValue = AppString.single;

  @override
  void initState() {
    super.initState();
    zoneController = TextEditingController();
    districtController = TextEditingController();
    gaPaNaController = TextEditingController();
    wadaController = TextEditingController();
    nameOfLocalRegController = TextEditingController();
    employeeRefController = TextEditingController();
    regController = TextEditingController();
    bsFormRefDateController = TextEditingController();
    adFormRefDateController = TextEditingController();
    familyFormRegnoController = TextEditingController();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    bsBabyDOBController = TextEditingController();
    adBabyDOBController = TextEditingController();
    castController = TextEditingController();
    physicalDeformityController = TextEditingController();
    babyDistrictController = TextEditingController();
    babyGaPaController = TextEditingController();
    babyWadaController = TextEditingController();
    abroadAddressController = TextEditingController();
    grandParentFirstName = TextEditingController();
    grandParentSurName = TextEditingController();
    fatherFirstName = TextEditingController();
    fatherSurName = TextEditingController();
    motherFirstName = TextEditingController();
    motherSurName = TextEditingController();
    //
    sadakMarg = TextEditingController();
    gauTol = TextEditingController();
    houseNumber = TextEditingController();
  }

  @override
  void dispose() {
    zoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppString.birthInfoForm,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDivider(color: dividerColor),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  AppString.fillByLocalRegistar,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDivider(color: dividerColor),
                const SizedBox(
                  height: 10,
                ),

                //zone
                CustomTextFormFiled(
                    title: AppString.zone,
                    hintText: "",
                    controller: zoneController,
                    spacing: 12),

                //district
                CustomTextFormFiled(
                    title: AppString.district,
                    hintText: "",
                    controller: districtController,
                    spacing: 12),

                //ga/na/pa
                CustomTextFormFiled(
                    title: AppString.gaPaNpa,
                    hintText: "",
                    controller: gaPaNaController,
                    spacing: 12),

                //wada
                CustomTextFormFiled(
                    title: AppString.wadaNo,
                    hintText: "",
                    controller: wadaController,
                    keyBoardType: TextInputType.number,
                    spacing: 12),

                //name of registar
                CustomTextFormFiled(
                    title: AppString.nameOfRegistar,
                    hintText: "",
                    controller: nameOfLocalRegController,
                    spacing: 12),

                //employee Ref
                CustomTextFormFiled(
                    title: AppString.employeeRefereenceNo,
                    hintText: "",
                    controller: employeeRefController,
                    keyBoardType: TextInputType.number,
                    spacing: 12),

                CustomTextFormFiled(
                    title: AppString.registrationNo,
                    hintText: "",
                    controller: regController,
                    keyBoardType: TextInputType.number,
                    spacing: 12),

                //Reg Date

                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormFiled(
                          title: AppString.registrationDate,
                          hintText: "Enter BS Date",
                          controller: bsFormRefDateController,
                          isreadOnly: true,
                          ontap: () async {
                            final date = await customBSDatePicker(context);
                            if (date != null) {
                              bsFormRefDateController.text =
                                  date.formatToNumericDate();
                            }
                          },
                          spacing: 12),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextFormFiled(
                          title: "",
                          hintText: "Enter AD Date",
                          controller: adFormRefDateController,
                          isreadOnly: true,
                          ontap: () async {
                            final date = await customADDatePicker(context);
                            if (date != null) {
                              adFormRefDateController.text =
                                  date.formatToNumericDate();
                            }
                          },
                          spacing: 12),
                    )
                  ],
                ),
                CustomTextFormFiled(
                    title: AppString.familyregistrationNo,
                    hintText: "",
                    controller: familyFormRegnoController,
                    keyBoardType: TextInputType.number,
                    spacing: 12),

                const SizedBox(
                  height: 20,
                ),
                CustomDivider(color: dividerColor),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "1. ${AppString.detailofNewborn}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDivider(color: dividerColor),

                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormFiled(
                          title: AppString.name,
                          hintText: "",
                          controller: nameController,
                          spacing: 12),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextFormFiled(
                          title: AppString.surName,
                          hintText: "",
                          controller: surnameController,
                          spacing: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormFiled(
                          title: AppString.dob,
                          hintText: "Enter BS Date",
                          controller: bsBabyDOBController,
                          isreadOnly: true,
                          ontap: () async {
                            final date = await customBSDatePicker(context);
                            if (date != null) {
                              bsBabyDOBController.text =
                                  date.formatToNumericDate();
                            }
                          },
                          spacing: 12),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextFormFiled(
                          title: "",
                          hintText: "Enter AD Date",
                          controller: adBabyDOBController,
                          isreadOnly: true,
                          ontap: () async {
                            final date = await customADDatePicker(context);
                            if (date != null) {
                              adBabyDOBController.text =
                                  date.formatToNumericDate();
                            }
                          },
                          spacing: 12),
                    )
                  ],
                ),
                CustomDropDownFormField(
                  items: birthSite,
                  value: birthSiteValue,
                  title: AppString.placeOfBirth,
                  onChanged: (p0) {
                    birthSiteValue = p0!;
                    setState(() {});
                  },
                ),
                CustomDropDownFormField(
                  items: helpBy,
                  value: helpByValue,
                  title: AppString.personwhohelpsduringchildbirth,
                  onChanged: (p0) {
                    helpByValue = p0!;
                    setState(() {});
                  },
                ),
                CustomDropDownFormField(
                  items: gender,
                  value: genderValue,
                  title: AppString.gender,
                  onChanged: (p0) {
                    genderValue = p0!;
                    setState(() {});
                  },
                ),
                CustomTextFormFiled(
                    title: AppString.casteRace,
                    hintText: "",
                    controller: castController,
                    spacing: 12),
                CustomDropDownFormField(
                  items: birthType,
                  value: birthTypeValue,
                  title: AppString.typeofBirth,
                  onChanged: (p0) {
                    birthTypeValue = p0!;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  AppString.anyphysicaldeformity,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                Row(
                  children: [
                    Expanded(
                      child: CustomRadioButton(
                        groupValue: deformity,
                        value: Deformity.yes,
                        onChanged: (value) {
                          deformity = value;
                          setState(() {});
                        },
                        title: AppString.yes,
                      ),
                    ),
                    Expanded(
                      child: CustomRadioButton(
                        groupValue: deformity,
                        value: Deformity.no,
                        onChanged: (value) {
                          deformity = value;
                          setState(() {});
                        },
                        title: AppString.no,
                      ),
                    ),
                  ],
                ),
                deformity.name == AppString.yes.toLowerCase()
                    ? CustomTextFormFiled(
                        title: AppString.mention,
                        hintText: "",
                        controller: physicalDeformityController,
                        spacing: 10)
                    : const SizedBox(),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  AppString.addressofbirth,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                CustomTextFormFiled(
                    title: AppString.district,
                    hintText: "",
                    controller: babyDistrictController,
                    spacing: 10),
                CustomTextFormFiled(
                    title: AppString.gaPaNpa,
                    hintText: "",
                    controller: babyGaPaController,
                    spacing: 10),
                CustomTextFormFiled(
                    title: AppString.wadaNo,
                    hintText: "",
                    controller: babyWadaController,
                    keyBoardType: TextInputType.number,
                    spacing: 10),
                CustomTextFormFiled(
                    title: AppString.addressifbornabroad,
                    hintText: "",
                    controller: abroadAddressController,
                    spacing: 10),

                const SizedBox(
                  height: 20,
                ),
                CustomDivider(color: dividerColor),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "2. ${AppString.nameofnewbornbabyFather}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDivider(color: dividerColor),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormFiled(
                          title: AppString.name,
                          hintText: "",
                          controller: grandParentFirstName,
                          spacing: 12),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextFormFiled(
                          title: AppString.surName,
                          hintText: "",
                          controller: grandParentSurName,
                          spacing: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomDivider(color: dividerColor),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "3. ${AppString.detailsofnewbornbabyparents}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDivider(color: dividerColor),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  AppString.fatherdetails,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormFiled(
                          title: AppString.name,
                          hintText: "",
                          controller: fatherFirstName,
                          spacing: 12),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextFormFiled(
                          title: AppString.surName,
                          hintText: "",
                          controller: fatherSurName,
                          spacing: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  AppString.motherdetails,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormFiled(
                          title: AppString.name,
                          hintText: "",
                          controller: motherFirstName,
                          spacing: 12),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextFormFiled(
                          title: AppString.surName,
                          hintText: "",
                          controller: motherSurName,
                          spacing: 12),
                    ),
                  ],
                ),
                //father details
                const SizedBox(
                  height: 20,
                ),
                //permanent address
                const Text(
                  AppString.permanentAddress,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),

                const Text(
                  AppString.fatherdetails,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                //district
                CustomTextFormFiled(
                  title: AppString.district,
                  hintText: '',
                  controller: districtController,
                  spacing: 12,
                ),
                const SizedBox(
                  height: 10,
                ),
//gapanap
                CustomTextFormFiled(
                  title: AppString.gaPaNpa,
                  hintText: "",
                  controller: babyGaPaController,
                  spacing: 12,
                ),
                const SizedBox(
                  height: 10,
                ),
                //wada
                CustomTextFormFiled(
                  title: AppString.wadaNo,
                  hintText: "",
                  controller: wadaController,
                  spacing: 12,
                ),
                const SizedBox(
                  height: 10,
                ),
                //sadak
                CustomTextFormFiled(
                  title: AppString.sadakmarg,
                  hintText: "",
                  controller: sadakMarg,
                  spacing: 12,
                ),
                const SizedBox(
                  height: 10,
                ),
                //gauTol
                CustomTextFormFiled(
                  title: AppString.gauTole,
                  hintText: "",
                  controller: gauTol,
                  spacing: 12,
                ),
                const SizedBox(
                  height: 10,
                ),
                //houseNumber
                CustomTextFormFiled(
                  title: AppString.houseNumber,
                  hintText: "",
                  controller: houseNumber,
                  spacing: 12,
                ),

                const SizedBox(
                  height: 20,
                ),
//mother details
                const Text(
                  AppString.motherdetails,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                //district
                CustomTextFormFiled(
                  title: AppString.district,
                  hintText: '',
                  controller: districtController,
                  spacing: 12,
                ),
                const SizedBox(
                  height: 10,
                ),
//gapanap
                CustomTextFormFiled(
                  title: AppString.gaPaNpa,
                  hintText: "",
                  controller: babyGaPaController,
                  spacing: 12,
                ),
                const SizedBox(
                  height: 10,
                ),
                //wada
                CustomTextFormFiled(
                  title: AppString.wadaNo,
                  hintText: "",
                  controller: wadaController,
                  spacing: 12,
                ),
                const SizedBox(
                  height: 10,
                ),
                //sadak
                CustomTextFormFiled(
                  title: AppString.sadakmarg,
                  hintText: "",
                  controller: sadakMarg,
                  spacing: 12,
                ),
                const SizedBox(
                  height: 10,
                ),
                //gauTol
                CustomTextFormFiled(
                  title: AppString.gauTole,
                  hintText: "",
                  controller: gauTol,
                  spacing: 12,
                ),
                const SizedBox(
                  height: 10,
                ),
                //houseNumber
                CustomTextFormFiled(
                  title: AppString.houseNumber,
                  hintText: "",
                  controller: houseNumber,
                  spacing: 12,
                ),

                //Button
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Consumer<LoadinProvider>(
                    builder: (context, loadinProvider, child) {
                      if (loadinProvider.isLoading) {
                        return CustomLoadingButton(color: purpleButtonColor);
                      } else {
                        return CustomButton(
                          title: "Generate PDF",
                          color: purpleButtonColor,
                          ontap: () async {
                            if (formKey.currentState!.validate()) {
                              loadinProvider.setLoading(true);
                              await pdfGenerator.generatePDF(
                                  fileName: AppString.birthInfoForm,
                                  zone: zoneController.text,
                                  district: districtController.text,
                                  gapa: gaPaNaController.text,
                                  wada: wadaController.text,
                                  nameofLocalReg: nameOfLocalRegController.text,
                                  empRefNo: employeeRefController.text,
                                  regNo: regController.text,
                                  formRegBSDate: bsFormRefDateController.text,
                                  formRegAdDate: adFormRefDateController.text,
                                  familyRegNo: familyFormRegnoController.text,
                                  babyFirstName: nameController.text,
                                  babySurName: surnameController.text,
                                  babyBS: bsBabyDOBController.text,
                                  babyAd: adBabyDOBController.text,
                                  palceOfBirth: birthSiteValue,
                                  helpBy: helpByValue,
                                  gender: genderValue,
                                  cast: castController.text,
                                  typeofBirth: birthTypeValue,
                                  deformity: deformity.name,
                                  deformityValue:
                                      physicalDeformityController.text,
                                  babyDistrict: babyDistrictController.text,
                                  babyGapa: babyGaPaController.text,
                                  babywada: babyWadaController.text,
                                  abroad: abroadAddressController.text,
                                  grandParentFirstName:
                                      grandParentFirstName.text,
                                  grandParentLastName: grandParentSurName.text,
                                  fatherName: fatherFirstName.text,
                                  fatherSurName: fatherSurName.text,
                                  motherName: motherFirstName.text,
                                  motherSurName: motherSurName.text);
                              loadinProvider.setLoading(false);
                            }
                          },
                          titleColor: Colors.white,
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
