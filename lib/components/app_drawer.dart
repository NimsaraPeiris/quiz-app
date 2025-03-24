import 'package:flutter/material.dart';
import 'package:phi_app/components/my_colors.dart';
import 'package:phi_app/pages/about_page.dart';
import 'package:phi_app/pages/home_page.dart';
import 'package:phi_app/services/auth_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: SizedBox(
                  width: 100,
                  child: Image.asset('lib/images/logo.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  leading: const Icon(Icons.home, color: MyColors.mainColor),
                  title: const Text(
                    'Home',
                    style: TextStyle(color: MyColors.mainColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()),
                    );
                  },
                  leading: const Icon(Icons.info, color: MyColors.mainColor),
                  title: const Text(
                    'About',
                    style: TextStyle(color: MyColors.mainColor),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 0),
                child: ListTile(
                  title: Text(
                    AuthService.userEmail, // Get email directly
                    style: const TextStyle(color: MyColors.mainColor, fontSize: 15),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25, bottom: 20),
                child: ListTile(
                  onTap: AuthService.signUserOut, // Call sign-out directly
                  leading: Icon(Icons.logout, color: MyColors.mainColor),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        color: MyColors.mainColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
