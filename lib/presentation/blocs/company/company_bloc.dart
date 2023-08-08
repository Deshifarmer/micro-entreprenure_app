import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/repositories/company_repo_impl.dart';
import 'package:deshifarmer/domain/entities/company_entity/all_company_entity.dart';
import 'package:equatable/equatable.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyBloc() : super(CompanyInitial()) {
    on<CompanyFetchEvent>(_onCompanyFetchEvent);
  }

  CompanyListImpl companyListImpl = CompanyListImpl();
  FutureOr<void> _onCompanyFetchEvent(CompanyFetchEvent event, emit) async {
    final allCompanies = await companyListImpl.getCompanies(event.token);
    final value = switch (allCompanies) {
      Success(data: final succ) => succ,
      ServerFailor(error: final err) => err,
    };
    if (value is AllCompanyListResp) {
      print('company success !');
      emit(CompanySuccess(value));
    } else {
      print('company failor !');

      emit(CompanyFailed());
    }
  }
}
