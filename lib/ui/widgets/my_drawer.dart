import 'package:flutter/material.dart';
import 'package:tasbeeh_counter/ui/screens/about_us.dart';
import 'package:tasbeeh_counter/ui/screens/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  _sendMail() async {
    // Android and iOS
    const uri = 'mailto:skybotstechnology@gmail.com?subject=Help';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 50.0,
                  child: Text(
                    "C",
                    style: TextStyle(fontSize: 35.0),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Counter App",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  height: 1.0,
                  thickness: 1.0,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        //Now let's Add the button for the Menu
        //and let's copy that and modify it

        ListTile(
          onTap: () {
            Navigator.pop(context);
          },
          leading: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          title: Text("Settings"),
        ),

        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AboutUs()));
          },
          leading: Icon(
            Icons.info,
            color: Colors.black,
          ),
          title: Text("About Us"),
        ),

        ListTile(
          onTap: () {
            _sendMail();
          },
          leading: Icon(
            Icons.help,
            color: Colors.black,
          ),
          title: Text("Help"),
        ),
      ]),
    );
  }
}
