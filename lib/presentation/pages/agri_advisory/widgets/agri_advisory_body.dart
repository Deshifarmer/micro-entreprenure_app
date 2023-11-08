import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/data/repositories/group_detail_repo_imp.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/components/advisory_files_pick.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/components/advisory_timeslot.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/components/agri_subjects.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/components/selectable_group_or_farmer.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/cubit/list_for_farmers_cubit.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

/// Body of the AgriAdvisoryPage.
/// Add what it does

GroupDetailRepoImpl groupDetailRepoImpl = GroupDetailRepoImpl();

class AgriAdvisoryBody extends StatelessWidget {
  const AgriAdvisoryBody({super.key});

  /// {@macro agri_advisory_body}
  @override
  Widget build(BuildContext context) {
    final agriAdvisory = context.read<AgriAdvisoryBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          const Text(
            'কৃষি পরামর্শ রেকর্ড',
            style: TextStyle(
              color: tertiaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          widgetHeight(10),
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text('Record a video/take a photo'),
          //     Text('Select a file'),
          //   ],
          // ),
          const AdvisoryFileUploadField(),
          widgetHeight(20),
          const Text('বিষয়বস্তু কি?'),

          const AdvisorySubjects(),
          widgetHeight(20),
          const Text('মিটিং এর আনুমানিক দৈর্ঘ'),
          const SizedBox(
            height: 52,
            child: AdvisoryTimeslot(),
          ),

          widgetHeight(20),
          ///! farmer group
          const SelectableGroupOrFarmer(),
          BlocConsumer<ListForFarmersCubit, ListForFarmersState>(
            listener: (context, state) {},
            builder: (context, state) {
              // debugPrint("whats goin on here!");
              if (state is AddingListForFarmers && state.farmers.isNotEmpty) {
                return Column(
                  children: [
                    widgetHeight(20),
                    const Text('কারা এই মিটিং থাকবে ?'),
                    widgetHeight(10),
                    Wrap(
                      children: [
                        for (final member in state.farmers)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FilterChip(
                              backgroundColor: const Color(0xffd9d9d9),
                              label: Text(
                                member.full_name ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              checkmarkColor: tertiaryColor,
                              avatar: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: checkDomain(
                                    Strings.getServerOrLocal(
                                      ServerOrLocal.server,
                                    ),
                                  )
                                      ? dummyImage
                                      : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${member.image}',
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                      color: Colors.green[600],
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              side: BorderSide.none,
                              onSelected: (s) {},
                              selected: true,
                            ),
                          ),
                      ],
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
          widgetHeight(30),
          // a write note
          const Text('মিটিং নোটস'),
          widgetHeight(10),
          Padding(
            padding: const EdgeInsets.all(8),
            child: agriAdvisory is AgriAdvisoryInitial
                ? TextField(
                    maxLines: 4,
                    controller: agriAdvisory.notes,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      // fillColor: backgroundColor2,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      // hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
                      filled: true,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
