import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/constants.dart';
import 'package:sugar_mill_app/views/home_view/home_view_model.dart';
import 'package:sugar_mill_app/widgets/full_screen_loader.dart';

import '../../router.router.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: fullScreenLoader(
          loader: model.isBusy,
          context: context,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: Column(
                  children: [
                    ElevatedButton(onPressed: (){
                      // Navigator.pushNamed(
                      //   context,
                      //   Routes.addCaneScreen,
                      //
                      // );
                    },
                      style: ElevatedButton.styleFrom(minimumSize: Size(getWidth(context)-30, 50)), child: const Text("Register"),),
                    Container(height: 20,),
                    ElevatedButton(onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const RecognitionScreen()));
                    },
                      style: ElevatedButton.styleFrom(minimumSize: Size(getWidth(context)-30, 50)), child: const Text("Recognize"),),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.initialise(),
    );
  }
}
