import 'package:deshifarmer/domain/entities/batch/batch_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/api/harvest_api.dart';
import 'package:deshifarmer/presentation/pages/activity/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/pages/viewbatch/view_batches.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
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
    final token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';
    return FutureBuilder<List<BatchEnity>?>(
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          final value = snapshot.data;
          return value!.isEmpty
              ? const Center(
                  child: Text('কোনো কার্যকলাপ পাওয়া যায়নি'),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final currentActivity = value.elementAt(index);
                    debugPrint(currentActivity.batch_id);
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ViewBatchData(
                                batchEnity: currentActivity,
                              ),
                            ),
                          );
                        },
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: Text(currentActivity.which_crop),
                        subtitle: Text(currentActivity.season),
                        trailing: Text(currentActivity.farm_id),
                      ),
                    );
                  },
                );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.redAccent,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          );
        } else {
          return const Center(
            child: PrimaryLoadingIndicator(),
          );
        }
      },
      future: HarvestAPI().getLatestBatches(token: token),
    );
  }
}
