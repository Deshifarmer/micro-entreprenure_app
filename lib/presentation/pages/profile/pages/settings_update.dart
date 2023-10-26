import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/data/datasources/local/shared_prefs/local_database_sf.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

enum SettingsUpdateFields {
  notification,
  emailNotification,
  weatherAlert,
  promotionals,
}

final SharedPrefDBServices _sharedPrefDBServices = SharedPrefDBServices();

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

  //  final SharedPrefDBServices _sharedPrefDBServices = SharedPrefDBServices();
  // changes to be made

  // call the future builder for changing the fields
  Future<Map<String, bool?>> changeFields() async {
    final changedFields = <String, bool?>{};
    changedFields['notification'] =
        await _sharedPrefDBServices.isNotificationEnabled();
    changedFields['emailNotification'] =
        await _sharedPrefDBServices.isEmailEnabled();
    changedFields['weatherAlert'] =
        await _sharedPrefDBServices.isWeatherEnabled();
    changedFields['promotionals'] =
        await _sharedPrefDBServices.isPromotionalsEnabled();

    debugPrint('changed fields from init state: $changedFields');
    return changedFields;
  }

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
              child: CachedNetworkImage(
                imageUrl: checkDomain(
                  Strings.getServerOrLocal(ServerOrLocal.server),
                )
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
          FutureBuilder<Map<String, bool?>>(
            future: changeFields(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as Map<String, bool?>;
                debugPrint('data: $data');
                return Column(
                  children: [
                    SettingsSwitchButton(
                      title: 'Notification',
                      settingsUpdate: SettingsUpdateFields.notification,
                      isActive: data['notification'] ?? false,
                    ),
                    SettingsSwitchButton(
                      title: 'Email Notification',
                      settingsUpdate: SettingsUpdateFields.emailNotification,
                      isActive: data['emailNotification'] ?? false,
                    ),
                    SettingsSwitchButton(
                      title: 'Weather Alert',
                      settingsUpdate: SettingsUpdateFields.weatherAlert,
                      isActive: data['weatherAlert'] ?? false,
                    ),
                    SettingsSwitchButton(
                      title: 'Promotionals',
                      settingsUpdate: SettingsUpdateFields.promotionals,
                      isActive: data['promotionals'] ?? false,
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: SecondayButtonGreen(
        onpress: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: priceBoxColor,
              content: const Text(
                'This is Under progress',
              ),
              action: SnackBarAction(
                label: 'Okay',
                onPressed: () {},
              ),
            ),
          );
          // final changedFields = <String, bool?>{
          //   'notification': await _sharedPrefDBServices.isNotificationEnabled(),
          //   'emailNotification': await _sharedPrefDBServices.isEmailEnabled(),
          //   'weatherAlert': await _sharedPrefDBServices.isWeatherEnabled(),
          //   'promotionals': await _sharedPrefDBServices.isPromotionalsEnabled(),
          // };
          // debugPrint('changedFields: $changedFields');
        },
        title: 'Update Settings',
      ),
    );
  }
}

class SettingsSwitchButton extends StatelessWidget {
  const SettingsSwitchButton({
    required this.title,
    required this.settingsUpdate,
    required this.isActive,
    super.key,
  });
  final String title;
  final SettingsUpdateFields settingsUpdate;
  final bool isActive;
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
      trailing: SwitchToStf(
        settingsUpdate: settingsUpdate,
        isActive: isActive,
      ),
    );
  }
}

class SwitchToStf extends StatefulWidget {
  const SwitchToStf({
    required this.settingsUpdate,
    required this.isActive,
    super.key,
  });

  final SettingsUpdateFields settingsUpdate;
  final bool isActive;

  @override
  State<SwitchToStf> createState() => _SwitchToStfState();
}

class _SwitchToStfState extends State<SwitchToStf> {
  bool isActive = false;
  @override
  void initState() {
    super.initState();
    isActive = widget.isActive;
  }

  final SharedPrefDBServices _sharedPrefDBServices = SharedPrefDBServices();

  Future<void> enableSettings() async {
    switch (widget.settingsUpdate) {
      case SettingsUpdateFields.notification:
        // _sharedPrefDBServices.setNotificationEnabled();

        await _sharedPrefDBServices.setNotificationEnabled();
      case SettingsUpdateFields.emailNotification:
        // _sharedPrefDBServices.setEmailEnabled();
        await _sharedPrefDBServices.setEmailEnabled();
      case SettingsUpdateFields.weatherAlert:
        // _sharedPrefDBServices.setWeatherEnabled();
        await _sharedPrefDBServices.setWeatherEnabled();
      case SettingsUpdateFields.promotionals:
        // _sharedPrefDBServices.setPromotionalsEnabled();
        await _sharedPrefDBServices.setPromotionalsEnabled();
    }
  }

  Future<void> disableSettings() async {
    switch (widget.settingsUpdate) {
      case SettingsUpdateFields.notification:
        // _sharedPrefDBServices.setNotificationEnabled();
        await _sharedPrefDBServices.unsetNotificationEnabled();
      case SettingsUpdateFields.emailNotification:
        // _sharedPrefDBServices.setEmailEnabled();
        await _sharedPrefDBServices.unsetEmailEnabled();
      case SettingsUpdateFields.weatherAlert:
        // _sharedPrefDBServices.setWeatherEnabled();

        await _sharedPrefDBServices.unsetWeatherEnabled();
      case SettingsUpdateFields.promotionals:
        // _sharedPrefDBServices.setPromotionalsEnabled();
        await _sharedPrefDBServices.unsetPromotionalsEnabled();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeTrackColor: primaryColor,
      thumbColor: const MaterialStatePropertyAll(Colors.white),
      inactiveTrackColor: backgroundColor,
      value: isActive,
      onChanged: (bool? v) {
        if (v != null) {
          setState(() {
            isActive = v;
          });
          /*
          Let's do the local update here
          ! all the set methods are async
          */
          switch (v) {
            case true:
              enableSettings();
            case false:
              disableSettings();
          }
        }
      },
    );
  }
}
