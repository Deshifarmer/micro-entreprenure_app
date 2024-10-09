part of 'company_bloc.dart';

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();

  @override
  List<Object> get props => [];
}

class CompanyFetchEvent extends CompanyEvent {
  const CompanyFetchEvent(this.token);
  final String token;
}
