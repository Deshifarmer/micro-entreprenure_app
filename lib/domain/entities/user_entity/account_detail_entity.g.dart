// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetail _$AccountDetailFromJson(Map<String, dynamic> json) =>
    AccountDetail(
      acc_number: json['acc_number'] as String?,
      net_balance: json['net_balance'] as String?,
      total_credit: json['total_credit'] as String?,
      total_debit: json['total_debit'] as String?,
      last_transaction: json['last_transaction'] as String?,
      last_transaction_ammount: json['last_transaction_ammount'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$AccountDetailToJson(AccountDetail instance) =>
    <String, dynamic>{
      'acc_number': instance.acc_number,
      'net_balance': instance.net_balance,
      'total_credit': instance.total_credit,
      'total_debit': instance.total_debit,
      'last_transaction': instance.last_transaction,
      'last_transaction_ammount': instance.last_transaction_ammount,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
