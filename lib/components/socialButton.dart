import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  String title;
  String imageUrl;
  Function fun;
  SocialButton(
    this.title,
    this.imageUrl,
    this.fun,
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        child: Container(
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 18,
            margin: EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageUrl), fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ))),
        onTap: fun,
      ),
    );
  }
}
