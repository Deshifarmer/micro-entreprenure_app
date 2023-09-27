import 'package:deshifarmer/presentation/widgets/constraints.dart';

class Strings {
  Strings._();

  static const String title = 'Deshifarmer';
  static const String localDomain = 'http://192.168.68.140:8000';
  static const String serverDomain = 'https://core.deshifarmer.co';

  static String getServerOrLocal(ServerOrLocal sol) {
    // if (sol == ServerOrLocal.local) {
    //   return localDomain;
    // } else {
    //   return serverDomain;
    // }
    switch (sol) {
      case ServerOrLocal.local:
        return localDomain;
      case ServerOrLocal.server:
        return serverDomain;
    }
  }
}


///!---------------------TOP SECRET ---------------------------
/*
01896267197
df62me
*/

///!--------------------PUBLIC Secret -------------------------
/*
nadia@gmail.com
password
*/