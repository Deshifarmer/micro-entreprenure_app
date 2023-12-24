part of 'company_bloc.dart';

abstract class CompanyState extends Equatable {
  const CompanyState();

  @override
  List<Object> get props => [];
}

class CompanyInitial extends CompanyState {}

class CompanyFailed extends CompanyState {}

class CompanySuccess extends CompanyState {
  const CompanySuccess(this.allCompanyListResp);
  final AllCompanyListResp allCompanyListResp;
}
