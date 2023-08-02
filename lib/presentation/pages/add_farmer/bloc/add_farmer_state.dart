part of 'add_farmer_bloc.dart';

/// {@template add_farmer_state}
/// AddFarmerState description
/// {@endtemplate}
class AddFarmerState extends Equatable {
  /// {@macro add_farmer_state}
  const AddFarmerState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AddFarmerState with property changes
  AddFarmerState copyWith({
    String? customProperty,
  }) {
    return AddFarmerState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template add_farmer_initial}
/// The initial state of AddFarmerState
/// {@endtemplate}
class AddFarmerInitial extends AddFarmerState {
  /// {@macro add_farmer_initial}

  AddFarmerInitial() : super();

  ///! first photo
  final TextEditingController farmerImageController = TextEditingController();

  ///! first name
  final TextEditingController firstNameController = TextEditingController();

  ///! last name
  final TextEditingController lastNameController = TextEditingController();

  ///! dob
  final TextEditingController dobController = TextEditingController();

  ///! farmer's father
  final TextEditingController farmerFatherController = TextEditingController();

  ///! farmer's earning
  final TextEditingController farmerIncomeController = TextEditingController();

  ///! farmers NID
  final TextEditingController farmerNIDController = TextEditingController();

  ///! farmer's phone
  final TextEditingController farmerPhoneController = TextEditingController();

  ///! farmer's gender
  final TextEditingController farmerGenderController = TextEditingController();

  ///! farmer's relational status
  final TextEditingController farmerRelationalStatusController =
      TextEditingController();

  ///! farmer's division
  final TextEditingController farmerDivisionController =
      TextEditingController();

  ///! farmer's dist
  final TextEditingController farmerDistController = TextEditingController();

  ///! farmer's upzilla
  final TextEditingController farmerUpozillaController =
      TextEditingController();

  ///! union
  final TextEditingController farmerUnionController = TextEditingController();

  ///! village name
  final TextEditingController farmerVillageController = TextEditingController();

  ///! address
  final TextEditingController farmerAddressController = TextEditingController();

  ///! childrens
  final TextEditingController farmerChildrenController =
      TextEditingController();

  ///! family members
  final TextEditingController farmerFamilyMembersController =
      TextEditingController();

  ///! living years
  final TextEditingController farmerLivingYearController =
      TextEditingController();

  ///! govt id
  final TextEditingController farmerGovtIDController = TextEditingController();

  ///! land type
  final TextEditingController farmerLandTypeController =
      TextEditingController();

  ///! living type
  final TextEditingController farmerLivingTypeController =
      TextEditingController();

  ///! qt land
  final TextEditingController farmerQtLandController = TextEditingController();

  ///! -----------------------------------------------------
  // farmer's bank account
  ///! -----------------------------------------------------
  ///! bank name
  final TextEditingController farmerBankNameController =
      TextEditingController();

  ///! branch name
  final TextEditingController farmerBranchNameController =
      TextEditingController();

  ///! account number
  final TextEditingController farmerBankAccountNumberController =
      TextEditingController();

  ///! -----------------------------------------------------
  // farmer's MFS account
  ///! -----------------------------------------------------

  ///! account type
  final TextEditingController farmerMFSAccountTypeController =
      TextEditingController();

  ///! number
  final TextEditingController farmerMFSAccountNumberController =
      TextEditingController();

  ///! -----------------------------------------------------
  // add farmer to a Group
  ///! -----------------------------------------------------
  ///! group NAME, ID
  final TextEditingController farmerGroupIDController = TextEditingController();
}
