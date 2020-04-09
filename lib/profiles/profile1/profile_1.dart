import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'User.dart';
import 'provider.dart';

class Profile1 extends StatefulWidget {
  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  Profile profile = Profile1Provider.getProfile();
  Color _textColor = Color(0xff4e4e4e);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'Baloo'),
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/profiles/landscape_1.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: () {},
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ],
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'PROFILE',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                ),
                centerTitle: true,
              ),
              body: Stack(
                children: <Widget>[
                  CustomPaint(
                    painter: ProfilePainter(),
                    child: Container(),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.20,
                    child: CircleAvatar(
                      minRadius: 40,
                      backgroundImage: ExactAssetImage('assets/shard/1.jpg'),
                    ),
                  ),
                  _bodyText(context),
                  _bottomBar(context),
                ],
              )),
        ],
      ),
    );
  }

  TextStyle _bottomBarTitle= TextStyle(
  color: Colors.grey.shade400,
  );
  TextStyle _bottomBarsubTitle= TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold
  );

  Widget _bottomBar(BuildContext context) {
    return Positioned(
      left: 24,
      right: 24,
      bottom: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('FOLLWERS',style: _bottomBarTitle,),
              Text(profile.followers.toString(),style: _bottomBarsubTitle,)
            ],
          ),
          Column(
            children: <Widget>[
              Text('FOLLWING',style: _bottomBarTitle,),
              Text(profile.following.toString(),style: _bottomBarsubTitle,)
            ],
          ),
          Column(
            children: <Widget>[
              Text('FRIENDS',style: _bottomBarTitle,),
              Text(profile.friends.toString(),style: _bottomBarsubTitle,)
            ],
          ),
        ],
      ),
    );
  }

  Widget _bodyText(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.33,
      bottom: 0,
      right: 24,
      left: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 0,right: 8,top: 8,bottom: 0),
            child: Text(
              profile.user.name,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: _textColor),
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.grey,
              ),
              Text(
                profile.user.address,
                style: TextStyle(
                    color: _textColor,
                    fontSize: 14,),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top:28,bottom:10),
            child: Text(
              'ABOUT ME',
              style: TextStyle(color: _textColor
              ,fontSize: 16),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                profile.user.about,
                softWrap: true,
                style: TextStyle(color: Colors.black,
                fontSize: 15,
                  height: 1.4,
                  letterSpacing: 1.1,

                ),
              )),
        ],
      ),
    );
  }
}
//======================================================
class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.color = Colors.white;
    path.lineTo(0, size.height * 0.31);
    path.lineTo(size.width, size.height * 0.37);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.25);
    path.close();
    canvas.drawPath(path, paint);
//    path.addPolygon([
//      Offset(0, size.height * 0.35),
//      Offset(size.width, size.height * 0.45),
//      Offset(size.width, size.height),
//      Offset(0, size.height * 0.35),], true);
//    canvas.clipPath(path);
//    canvas.drawColor(Colors.white, BlendMode.color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
