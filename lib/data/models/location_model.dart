/* {
      "id": "1",
      "division_id": "3",
      "name": "Dhaka",
      "bn_name": "ঢাকা",
      "lat": "23.7115253",
      "long": "90.4111451"
    },
    */

class DistModel {
  const DistModel({
    required this.id,
    required this.divisionID,
    required this.name,
    required this.bnName,
    required this.lat,
    required this.long,
  });
  // ignore: avoid_multiple_declarations_per_line
  final String id, divisionID, name, bnName, lat, long;
}

/*
{
      "id": "1",
      "name": "Barishal",
      "bn_name": "বরিশাল",
      "lat": "22.701002",
      "long": "90.353451"
    },
*/

class DivisionModel {
  const DivisionModel({
    required this.id,
    required this.name,
    required this.bnName,
    required this.lat,
    required this.long,
  });
  // ignore: avoid_multiple_declarations_per_line
  final String id, name, bnName, lat, long;
}

/*
{
      "id": "1",
      "district_id": "34",
      "name": "Amtali",
      "bn_name": "আমতলী"
    },
*/

class UpozillaModel {
  const UpozillaModel({
    required this.id,
    required this.name,
    required this.bnName,
    required this.districtID,
  });
  // ignore: avoid_multiple_declarations_per_line
  final String id, districtID, name, bnName;
}
