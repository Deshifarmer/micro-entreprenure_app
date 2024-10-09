// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      transaction_id: json['transaction_id'] as String?,
      amount: json['amount'] as String?,
      order_id: json['order_id'] as String?,
      cash_in_id: json['cash_in_id'] as String?,
      cash_out_id: json['cash_out_id'] as String?,
      credited_to: json['credited_to'] as String?,
      debited_from: json['debited_from'] as String?,
      authorized_by: json['authorized_by'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'transaction_id': instance.transaction_id,
      'amount': instance.amount,
      'order_id': instance.order_id,
      'cash_in_id': instance.cash_in_id,
      'cash_out_id': instance.cash_out_id,
      'credited_to': instance.credited_to,
      'debited_from': instance.debited_from,
      'authorized_by': instance.authorized_by,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
