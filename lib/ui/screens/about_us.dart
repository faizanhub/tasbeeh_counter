import 'package:flutter/material.dart';
import 'package:tasbeeh_counter/ui/widgets/my_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  _openUrl() async {
    // Android and iOS
    const uri = 'https://skybotstechnology.com/';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: AppBar(
        title: Text("About Us"),
        elevation: 0.0,
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "Skybots Technology aims to Inspire business through technology by increasing their business Efficiency, Growth, and Sales by adopting the top leading and trending technology as per need of time and trends ",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                _openUrl();
              },
              child: Text(
                "\n\n https://skybotstechnology.com ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
