// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'account_detail_entity.g.dart';

@JsonSerializable()
class AccountDetail {
  const AccountDetail({
    required this.acc_number,
    required this.net_balance,
    required this.total_credit,
    required this.total_debit,
    required this.last_transaction,
    required this.last_transaction_ammount,
    required this.created_at,
    required this.updated_at,
  });
  factory AccountDetail.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailFromJson(json);
  final String? acc_number;
  final String? net_balance;
  final String? total_credit;
  final String? total_debit;
  final String? last_transaction;
  final String? last_transaction_ammount;
  final String? created_at;
  final String? updated_at;
}
