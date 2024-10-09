// import 'package:deshifarmer/data/datasources/models/user_profile_db.dart';
// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';

// class IsarDatabase {
//   IsarDatabase() {
//     // ignore: discarded_futures
//     db = openIsar();
//   }
//   late Future<Isar> db;

//   ///! Get user profile ENTITY
//   // Future<UserProfileEntity> _getUserProfileEntity() async {
//   //   final isar = await db;
//   //   final userScheme = await isar.userProfileCollections.where().findAll();
//   //   final userProfile = userScheme.first;
//   // }

//   ///! Insert User Profile
//   // Future<bool> insertUserProfile(UserProfileEntity upe) async{
//   //    final Isar isar = await db;
//   //   isar.writeTxnSync<int>(
//   //     () => isar.userProfileCollections.putSync(
//   //       upe,
//   //     ),
//   //   );
//   //   return true;
//   // }

//   /// open the db
//   Future<Isar> openIsar() async {
//     final dir = await getApplicationDocumentsDirectory();
//     if (Isar.instanceNames.isEmpty) {
//       return Isar.open(
//         <CollectionSchema<dynamic>>[
//           UserProfileCollectionSchema,
//         ],
//         directory: dir.path,
//       );
//     }
//     return Future<Isar>.value(Isar.getInstance());
//   }
// }
