import 'package:flutter/material.dart';
import 'package:higrow/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300,
                  // color: Colors.blue,
                  decoration: BoxDecoration(
                    color: AppColors.yellow2,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),

                Positioned(
                  height: 311,
                  width: 327,
                  top: -175,
                  left: 214,
                  child: CircleAvatar(backgroundColor: Colors.white60),
                ),
                Positioned(
                  height: 73,
                  width: 73,
                  top: 85,
                  left: 65,
                  child: CircleAvatar(backgroundColor: Colors.white60),
                ),
                Positioned(
                  height: 40,
                  width: 40,
                  top: 133,
                  left: 184,
                  child: CircleAvatar(backgroundColor: Colors.white60),
                ),

                Positioned(
                  bottom: -50,
                  left: MediaQuery.of(context).size.width / 2 - 55,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 46,
                      backgroundImage: AssetImage('assets/images/image.png'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Text('Muthia Rihadatul Aisyi'),
            Text('mutik@gimail.kom'),
            SizedBox(height: 40,),
            Container(
              width: 310,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.grey
              ),
            )
          ],
        ),
      ),
    );
  }
}
