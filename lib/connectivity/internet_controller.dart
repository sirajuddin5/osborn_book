

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class InternetController extends GetxController{

  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(NetStatus as void Function(List<ConnectivityResult> event)?);
  }

  void NetStatus(ConnectivityResult cr){
    if(cr == ConnectivityResult.none){
      // Get.rawSnackbar(
      //   title: 'No Internet',
      //   message: 'Connect to internet to proceed',
      //   icon: Icon(Icons.wifi_off, color: Colors.white,),
      //   isDismissible: true,
      //   shouldIconPulse: true,
      //   duration: Duration(days: 1),
      // );
      Get.rawSnackbar(
          titleText: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(Get.context!).size.height*0.9,
            ),
            width: double.infinity,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("No internet Connection", style: TextStyle(fontSize: 25,color: Colors.white),)
              ],
            ),
          ),
          messageText: SizedBox(),
          backgroundColor: Colors.black87,
          isDismissible: false,
          duration: Duration(days: 1)
      );
    }else{
      if(Get.isSnackbarOpen){
        Get.closeCurrentSnackbar();
      }
    }
  }
}