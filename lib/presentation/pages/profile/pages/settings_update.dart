import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({
    required this.fullName,
    required this.farmerID,
    required this.farmerPhoto,
    super.key,
  });

  final String? fullName;
  final String? farmerID;
  final String? farmerPhoto;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                checkDomain(Strings.getServerOrLocal(ServerOrLocal.server))
                    ? dummyImage
                    : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/$farmerPhoto',
                fit: BoxFit.cover,
                /* errorBuilder: (
                        context,
                        error,
                        stackTrace,
                      ) {
                        return Center(
                          child: Text(
                            'Image Error',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Colors.redAccent,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        );
ss                       }, */
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              fullName ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          /// code
          Text(
            '#$farmerID',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),

          // Text('আমরা আপনাকে কীভাবে সাহায্য করতে পারি  ?'),
          const SettingsSwitchButton(
            title: 'Notification',
          ),

          const SettingsSwitchButton(
            title: 'Email Notification',
          ),

          SettingsSwitchButton(
            title: 'Weather alert',
          ),
          SettingsSwitchButton(
            title: 'Promotionals',
          ),
        ],
      ),
      bottomNavigationBar: SecondayButtonGreen(
        onpress: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: priceBoxColor,
              content: const Text('This is Under progress'),
              action: SnackBarAction(label: 'Okay', onPressed: () {}),
            ),
          );
        },
        title: 'Update Settings',
      ),
    );
  }
}

class SettingsSwitchButton extends StatelessWidget {
  const SettingsSwitchButton({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        // 'Notification',
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      trailing: const SwitchToStf(),
    );
  }
}

class SwitchToStf extends StatefulWidget {
  const SwitchToStf({
    super.key,
  });

  @override
  State<SwitchToStf> createState() => _SwitchToStfState();
}

class _SwitchToStfState extends State<SwitchToStf> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeTrackColor: primaryColor,
      thumbColor: const MaterialStatePropertyAll(Colors.white),
      inactiveTrackColor: backgroundColor,
      value: isActive,
      onChanged: (bool? v) {
        if (v != null)
          setState(() {
            isActive = v;
          });
      },
    );
  }
}
