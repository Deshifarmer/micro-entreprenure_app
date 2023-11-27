class FinanceModel {
  const FinanceModel({
    required this.farmerID,
    required this.season,
    required this.crop,
    required this.pol,
    required this.amount,
    required this.note,
    this.variety,
    this.eta,
  });
  final String farmerID;
  final String season;
  final String crop;
  final String? variety;
  final String pol;
  final String amount;
  final String? eta;
  final String? note;
}
