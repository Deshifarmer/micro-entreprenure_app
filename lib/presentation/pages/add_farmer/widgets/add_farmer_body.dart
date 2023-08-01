import 'package:deshifarmer/data/datasources/local/corps/corps_db.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/children_form_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/dist_select_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/division_form_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/family_member_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/farmer_dob_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/farmer_gender_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/farmer_profile_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/field_form_type_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/group_fields_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/living_type_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/living_year_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/m_bank_ac_type_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/upozilla_form_field.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

/// {@template add_farmer_body}
/// Body of the AddFarmerPage.
///
/// Add what it does
/// {@endtemplate}
class AddFarmerBody extends StatelessWidget {
  /// {@macro add_farmer_body}
  const AddFarmerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFarmerBloc, AddFarmerState>(
      builder: (context, state) {
        return ListView(
          children: [
            ///* picture upload
            const FarmerProfilePicUpload(),

            /// first name
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'নামের প্রথম অংশ',
                  hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* last name
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'নামের শেষ অংশ',
                  hintText: 'কৃষকের নামের শেষ অংশ লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* dob field
            const FarmarDOB(),

            ///* father's name (farmar)
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'কৃষকের পিতার নাম',
                  filled: true,
                ),
              ),
            ),

            ///* nid
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'কৃষকের এনআইডি নম্বর',
                  hintText: 'কৃষকের এনআইডি নম্বর লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* phone
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                maxLength: 11,
                decoration: const InputDecoration(
                  // helperText: '019999999999',
                  // icon: Text('+88'),
                  // prefixIcon: Container(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     '+88',
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  // prefix: Text('+88'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'কৃষকের ফোন নম্বর',
                  hintText: 'কৃষকের ফোন নম্বর লিখুন',
                  filled: true,
                ),
              ),
            ),

            // PhoneWidget(),

            ///* gender & marital Status
            const Row(
              children: [
                Expanded(child: GenderField()),
                Expanded(child: MaritalStatusField()),
              ],
            ),

            const Row(
              children: [
                Expanded(child: DistFormField()),
                Expanded(child: DivisionFormField()),
              ],
            ),
            const UpzillaFormField(),

            ///* union
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'ইউনিয়ন',
                  // hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* village name
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'গ্রামের নাম',
                  // hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* address
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'ঠিকানা',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 15,
                  ),
                  // hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
                  filled: true,
                ),
              ),
            ),

            const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ChildrenFormField(),
                ),
                Expanded(
                  flex: 3,
                  child: FamilyMemberFormField(),
                ),
              ],
            ),

            ///* how long is he/she living there
            const LivingYearFormField(),

            ///* yearly income
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'কৃষকের বার্ষিক আয়',
                  filled: true,
                ),
              ),
            ),

            ///* farmar id (leave blank)
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'সরকারি কৃষক আইডি (না থাকলে ফাকা রাখুন)',
                  filled: true,
                ),
              ),
            ),

            ///* living house type (own/rantal)

            ///* land type
            const Row(
              children: [
                Expanded(child: FieldTypeFormField()),
                Expanded(child: LivingTypeFormField()),
              ],
            ),

            ///* land messure
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'জমির পরিমাণ',
                  filled: true,
                ),
              ),
            ),

            ///! Expansion tile of farmer Bank account
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.green[200],
              ),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: ExpansionTile(
                title: const Text('কৃষকের ব্যাংক একাউন্ট রয়েছে'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        labelText: 'ব্যাংকের নাম',
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        labelText: 'শাখার নাম',
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        labelText: 'একাউন্ট নাম্বার',
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///* bkash/nogod/mfs

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //color: Colors.green[200],
              ),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: ExpansionTile(
                title:
                    const Text('বিকাশ /নগদ/উপায় বা অন্যান্য MFS একাউন্ট রয়েছে'),
                children: [
                  const MBankAccountType(),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        labelText: 'এম-এফএস একাউন্ট নম্বর',
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //! Group fields from CUBIT

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //color: Colors.green[200],
              ),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: ExpansionTile(
                title: const Text(
                  'গ্রুপে যোগ করতে চাইলে এইখানে ক্লিক করুন এবং গ্রুপ সিলেক্ট করুন',
                ),
                children: [
                  const GroupSelector(),
                ],
              ),
            ),

            //! TESting

            //! a multi select field
            Padding(
              padding: const EdgeInsets.all(8),
              child: MultiSelectDropDown(
                hint: 'বর্তমান উৎপাদনকারী ফসল নির্বাচন করুন',
                chipConfig: ChipConfig(
                  wrapType: WrapType.wrap,
                  backgroundColor: Colors.green[400],
                ),
                selectedOptionTextColor: Colors.green,
                options:
                    cropsDatabase.map((e) => ValueItem(label: e.name)).toList(),
                onOptionSelected: (selectedOptions) {},
                padding: const EdgeInsets.all(8),
                dropdownHeight: MediaQuery.of(context).size.height / 2.5,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: MultiSelectDropDown(
                hint: 'প্রধান ফসল নির্বাচন',
                chipConfig: ChipConfig(
                  wrapType: WrapType.wrap,
                  backgroundColor: Colors.green[400],
                ),
                selectedOptionTextColor: Colors.green,
                options:
                    cropsDatabase.map((e) => ValueItem(label: e.name)).toList(),
                onOptionSelected: (selectedOptions) {},
                padding: const EdgeInsets.all(8),
                dropdownHeight: MediaQuery.of(context).size.height / 2.5,
              ),
            ),

            ///* A submit Button
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green[600]),
                ),
                onPressed: () {},
                child: const Text(
                  'কৃষক যোগ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
