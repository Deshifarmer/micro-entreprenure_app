enum ActivityTypeEnums {
  // জমি তৈরী
  landpref,
  // বপন
  sowing,
  // সেচ রেকর্ড
  irrigation,
  // Weedign
  // weeding,
  // কীটনাশক প্রদান
  pesticide,
  // সার প্রদান
  fertilizer,
  // উৎপাদন রেকর্ড
  // production,
  // // report problem
  reportProblem,
}

Map<String, ActivityTypeEnums> activityRecordValues = {
  'জমি তৈরী': ActivityTypeEnums.landpref,
  'বপন': ActivityTypeEnums.sowing,
  'সেচ রেকর্ড': ActivityTypeEnums.irrigation,
  'কীটনাশক প্রদান': ActivityTypeEnums.pesticide,
  'সার প্রদান': ActivityTypeEnums.fertilizer,
  // 'উৎপাদন রেকর্ড': ActivityTypeEnums.production,
};
