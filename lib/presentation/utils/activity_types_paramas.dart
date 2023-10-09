enum ActivityTypeEnums {
  landpref,
  sowing,
  irrigation,
  weeding,
}

Map<String, ActivityTypeEnums> activityRecordValues = {
  'জমি তৈরী': ActivityTypeEnums.landpref,
  'বপন': ActivityTypeEnums.sowing,
  'সেচ রেকর্ড ': ActivityTypeEnums.irrigation,
  'Weedign': ActivityTypeEnums.weeding,
  'কীটনাশক প্রদান': ActivityTypeEnums.irrigation,
  'সার প্রদান': ActivityTypeEnums.irrigation,
  'উৎপাদন রেকর্ড': ActivityTypeEnums.irrigation,
  'report problem': ActivityTypeEnums.irrigation,
};
