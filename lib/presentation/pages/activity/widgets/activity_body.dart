import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/activity_entity/activity_famer_detail.dart';
import 'package:deshifarmer/domain/entities/activity_entity/all_activity_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:flutter/material.dart';

/// {@template activity_body}
/// Body of the ActivityPage.
///
/// Add what it does
/// {@endtemplate}
class ActivityBody extends StatelessWidget {
  /// {@macro activity_body}
  const ActivityBody({super.key});

  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginBloc>().state;
    return BlocBuilder<ActivityBloc, ActivityState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (loginState is LoginSuccess)
                  FutureBuilder(
                    future: DeshiFarmerAPI()
                        .getAllActivities(loginState.successLoginEntity.token),
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        // print(snapshot.data);

                        final value = switch (snapshot.data) {
                          Success(data: final succ) => succ,
                          ServerFailor(error: final err) => err,
                          null => null,
                        };
                        if (value is AllActivityListResp) {
                          print('list of yes');
                          return value.activities.isEmpty
                              ? const Center(
                                  child: Text('কোনো কার্যকলাপ পাওয়া যায়নি'),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: value.activities.length,
                                  itemBuilder: (context, index) {
                                    final currentActivity =
                                        value.activities.elementAt(index);
                                    final currentFarmer =
                                        ActivityFarmerDetails.fromJson(
                                            currentActivity.farmer_details.first
                                                as Map<String, dynamic>);
                                    print(currentActivity.images);
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 88,
                                            child: AspectRatio(
                                              aspectRatio: 0.88,
                                              child: Container(
                                                padding: EdgeInsets.all(
                                                  getProportionateScreenWidth(
                                                    10,
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                    0xFFF5F6F9,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Image.network(
                                                  checkDomain(Strings
                                                          .getServerOrLocal(
                                                              ServerOrLocal
                                                                  .server))
                                                      ? dummyImage
                                                      : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${currentActivity.images}',
                                                  errorBuilder: (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) {
                                                    return Center(
                                                      child: Text(
                                                        'Image Error',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall!
                                                            .copyWith(
                                                              color: Colors
                                                                  .redAccent,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width /
                                                        1.8,
                                                child: Text(
                                                  currentActivity.name,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    height: 1,
                                                  ),
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.fade,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                'Farmer: ${currentFarmer.full_name}',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                maxLines: 2,
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                'Crop: ${currentActivity.crop}',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                        } else if (value is ServerFailor) {
                          return Text('Server Failor ${value.error}');
                        }

                        return const SizedBox.shrink();
                      } else if (snapshot.hasError) {
                        return const Text('Error Getting data');
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: PrimaryLoadingIndicator(),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemCount: 10,
                //   itemBuilder: (context, index) {
                //     return Padding(
                //       padding: const EdgeInsets.symmetric(
                //         vertical: 10,
                //       ),
                //       child: Row(
                //         children: [
                //           SizedBox(
                //             width: 88,
                //             child: AspectRatio(
                //               aspectRatio: 0.88,
                //               child: Container(
                //                 padding: EdgeInsets.all(
                //                     getProportionateScreenWidth(10)),
                //                 decoration: BoxDecoration(
                //                   color: const Color(0xFFF5F6F9),
                //                   borderRadius: BorderRadius.circular(15),
                //                 ),
                //                 child: Image.network(
                //                   checkDomain(Strings.getServerOrLocal(ServerOrLocal.server))
                //                       ? dummyImage
                //                       : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage',
                //                   errorBuilder: (context, error, stackTrace) {
                //                     return Center(
                //                       child: Text(
                //                         'Image Error',
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .titleSmall!
                //                             .copyWith(
                //                               color: Colors.redAccent,
                //                               fontStyle: FontStyle.italic,
                //                             ),
                //                       ),
                //                     );
                //                   },
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(width: 20),
                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               SizedBox(
                //                 width: MediaQuery.sizeOf(context).width / 1.8,
                //                 child: const Text(
                //                   'Recorded Crop Hervest',
                //                   style: TextStyle(
                //                     color: Colors.black,
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.bold,
                //                     height: 1,
                //                   ),
                //                   softWrap: true,
                //                   maxLines: 2,
                //                   overflow: TextOverflow.fade,
                //                 ),
                //               ),
                //               const SizedBox(height: 10),
                //               const Text(
                //                 'Farmer: Ramiz uddin',
                //                 style: TextStyle(
                //                   color: Colors.black,
                //                   fontSize: 14,
                //                   fontWeight: FontWeight.w400,
                //                 ),
                //                 maxLines: 2,
                //               ),
                //               const SizedBox(height: 10),
                //               const Text(
                //                 'Crop: rice',
                //                 style: TextStyle(
                //                   color: Colors.black,
                //                   fontSize: 14,
                //                   fontWeight: FontWeight.w400,
                //                 ),
                //                 maxLines: 2,
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
