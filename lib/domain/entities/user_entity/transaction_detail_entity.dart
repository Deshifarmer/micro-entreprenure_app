// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'transaction_detail_entity.g.dart';

@JsonSerializable()
class Transaction {
  const Transaction({
    required this.transaction_id,
    required this.amount,
    required this.order_id,
    required this.cash_in_id,
    required this.cash_out_id,
    required this.credited_to,
    required this.debited_from,
    required this.authorized_by,
    required this.created_at,
    required this.updated_at,
  });
  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  final String? transaction_id;
  final String? amount;
  final String? order_id;
  final String? cash_in_id;
  final String? cash_out_id;
  final String? credited_to;
  final String? debited_from;
  final String? authorized_by;
  final String? created_at;
  final String? updated_at;
}
