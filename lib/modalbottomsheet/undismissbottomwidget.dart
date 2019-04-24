import 'package:flutter/material.dart';

/// 在showModalBottomSheet的widget顶层包一个gesturedetector使ontap为false
/// 解决showModalBottomSheet点击之后总是消失的问题
class UndismissSharePopup extends StatelessWidget {
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
    return Center(
      child: Row(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200.0,
                    color: Color(0xfff1f1f1),
                    child: Center(
                      child: Text("底部面板,点击消失"),
                    ),
                  );
                },
              );
            },
            child: Text("底部面板,点击消失"),
          ),
          RaisedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return GestureDetector(
                    child: Container(
                      height: 2000.0,
                      color: Color(0xfff1f1f1),
                      child: Center(
                        child: Text("底部面板,点击底部面板不消失"),
                      ),
                    ),
                    onTap: () => false,
                  );
                },
              );
            },
            child: Text("底部面板,点击底部面板不消失"),
          ),
        ],
      ),
    );
  }
}
