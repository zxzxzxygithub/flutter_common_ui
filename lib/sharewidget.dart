import 'package:flutter/material.dart';

class SharePopup extends StatelessWidget {
  List<String> nameItems = <String>[
    '微信', '朋友圈', 'QQ', 'QQ空间', '微博', 'FaceBook', '邮件', '链接'
  ];
  List<String> urlItems = <String>[
    'icon_wechat.png', 'icon_wechat_moments.png', 'icon_qq.png', 'icon_qzone.png',
    'icon_sina.png', 'icon_facebook.png', 'icon_email.png', 'icon_copylink.png'
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("分享页面"),
        ),
        body: new Center(
          child: new Builder(builder: (BuildContext context) {
            return new FlatButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return _shareWidget(context);
                      });
                },
                child: new Text("我要分享"),
                color: Colors.blue);
          }),
        ));
  }

  Widget _shareWidget(BuildContext context) {
    return new Container(
      height: 250.0,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: new Container(
              height: 190.0,
              child: new GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 5.0,
                    childAspectRatio: 1.0),
                itemBuilder: (BuildContext context, int index) {
                  return new Column(
                    children: <Widget>[
                      new Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
                          child: new Image.asset( 'images/${urlItems[index]}', width: 50.0, height: 50.0, fit: BoxFit.fill, ) ),
                      new Text(nameItems[index])
                    ],
                  );
                },
                itemCount: nameItems.length,
              ),
            ),
          ),
          Divider(height:1,
            color:  Colors.red,),
          new Center( child: new Padding(
              padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
              child: new Text( '取  消', style: new TextStyle(fontSize: 18.0, color: Colors.blueGrey), ) ), )
        ],
      ),
    );
  }
}
