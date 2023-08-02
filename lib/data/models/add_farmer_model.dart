class AddFarmerModel {
  const AddFarmerModel({
    required this.nid,
    required this.firstName,
    required this.lastName,
    required this.fathersName,
    required this.phone,
    required this.isMarried,
    required this.gender,
    required this.dateOfBirth,
    required this.address,
    required this.village,
    required this.union,
    required this.upazila,
    required this.district,
    required this.division,
    required this.residentType,
    required this.familyMember,
    required this.numberOfChildren,
    required this.yearlyIncome,
    required this.yearOfStayIn,
    this.groupId,
    this.farmArea,
    this.farmType,
    this.bankDetails,
    this.mfsAccount,
    this.currentProducingCrop,
    this.focusedCrop,
    this.image,
    this.farmerType,
    // this.creditScore,
    this.farmId, //required this.croppingIntensity,
    this.govtFarmerID,
    this.onboardBy,
  });
  final int nid;
  final String firstName;
  final String? image;
  final String? farmerType;
  final String? govtFarmerID;
  final String? onboardBy;
  final String lastName;
  final String fathersName;
  final String phone;
  final bool isMarried;
  final String gender;
  final DateTime dateOfBirth;
  final String address;
  final String village;
  final String union;
  final int upazila;
  final int district;
  final int division;
  // final double? creditScore;
  final String residentType;
  final int familyMember;
  final int numberOfChildren;
  final int yearlyIncome;
  final double yearOfStayIn;
  final String? groupId;
  final String? farmArea;
  final String? farmType;
  final Map<String, dynamic>? bankDetails;
  final Map<String, dynamic>? mfsAccount;
  final Map<String, dynamic>? currentProducingCrop;
  final Map<String, dynamic>? focusedCrop;
  final Map<String, dynamic>? farmId;
}
