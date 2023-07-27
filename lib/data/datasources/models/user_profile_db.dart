// ignore_for_file: non_constant_identifier_names

import 'package:isar/isar.dart';

part 'user_profile_db.g.dart';

@collection
class UserProfileCollection {
  Id id = Isar.autoIncrement;
  String? df_id;
  String? full_name;
  int? nid;
  String? phone;
  String? email;
  String? designation;
  String? previous_designation;
  String? previous_company;
  String? photo;
  String? channel;
  String? date_of_birth;
  String? present_address;
  String? permanent_address;
  String? home_district;
  String? joining_date;
  int? type;
  String? gender;
  String? department;
  String? work_place;
  String? commission;
  String? updated_at;
  String? target_volume;
  List<AccountDetailDB>? account_details;
  List<TransactionDB>? transactions;
  int? total_sale;
  int? total_farmer;
}

@embedded
class AccountDetailDB {
  String? acc_number;
  String? net_balance;
  String? total_credit;
  String? total_debit;
  String? last_transaction;
  String? last_transaction_ammount;
  String? created_at;
  String? updated_at;
}

@embedded
class TransactionDB {
  String? transaction_id;
  String? amount;
  String? order_id;
  String? cash_in_id;
  String? cash_out_id;
  String? credited_to;
  String? debited_from;
  String? authorized_by;
  String? created_at;
  String? updated_at;
}
