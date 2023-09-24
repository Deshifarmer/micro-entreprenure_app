
import 'package:deshifarmer/data/datasources/remote/apis/attendance_api.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class CheckInHistory extends StatelessWidget {
  const CheckInHistory({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginBloc>().state;
    final token = (loginState as LoginSuccess).successLoginEntity.token;
    return FutureBuilder(
      future: AttendanceAPI().attendanceHistory(
        token,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            ConnectionState.done == snapshot.connectionState) {
          print('successully got the data -> ${snapshot.data}');
          // print('datatype atthis -> ${snapshot.data.$2}')

          final data = snapshot.data!.$1;
          print('data -> ${data.length}');

          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final currentHistry = data.elementAt(index);

              final h = int.parse(currentHistry.work_hour);
              // return Text('hola');
              print('history -> $currentHistry');
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currentHistry.date,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    /// h n p
                    Row(
                      children: [
                        Text(
                          '${h}hrs',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 10,
                          width: 200,
                          child: FAProgressBar(
                            changeProgressColor: Colors.pink,
                            backgroundColor: const Color(0xffd9d9d9),
                            progressColor: primaryColor,
                            verticalDirection: VerticalDirection.up,
                            currentValue: h.toDouble(),
                            maxValue: 9,
                            // size: 81,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
          // return Text('sdfl');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: PrimaryLoadingIndicator(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
