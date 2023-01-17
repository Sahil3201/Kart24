import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kart24/screens/productView.dart';
import 'package:kart24/screens/readFile.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[700]!,
      margin: const EdgeInsets.only(right: 100.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: ListView(
          // padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: 25),
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                  "https://png.pngtree.com/png-vector/20191101/ourlarge/pngtree-male-avatar-simple-cartoon-design-png-image_1934458.jpg"),
            ),
            // DrawerHeader(
            //   child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Image(
            //         image: AssetImage('assets/images/carousel_1.png'),
            //         width: 50,
            //       )),
            //   decoration: BoxDecoration(
            //     color: Colors.red[700]!,
            //   ),
            // ),
            SizedBox(height: 50),
            Text("Hello, Sahil L.",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffffffff),
                )),
            SizedBox(height: 15),
            ListTile(
              leading: Icon(Icons.playlist_add_check_outlined,
                  color: const Color(0xffffffff), size: 32.0),
              onTap: () {},
              title: Text(
                'Past orders',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 21,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            SizedBox(height: 15),
            ListTile(
              leading: Icon(Icons.notifications_outlined,
                  color: const Color(0xffffffff), size: 32.0),
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 21,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            SizedBox(height: 15),
            ListTile(
              leading: Icon(Icons.settings_outlined,
                  color: const Color(0xffffffff), size: 32.0),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 21,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            SizedBox(height: 90.0),
            ListTile(
              leading: Icon(Icons.logout,
                  color: const Color(0xffffffff), size: 32.0),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 21,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            ListTile(
              leading: Icon(Icons.download,
                  color: const Color(0xffffffff), size: 32.0),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ReadFile())),
              title: Text(
                'Read From File',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 21,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
