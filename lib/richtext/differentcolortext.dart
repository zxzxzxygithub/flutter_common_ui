import 'package:flutter/material.dart';

class ColoredRichText extends StatefulWidget {
  @override
  _ColoredRichTextState createState() => _ColoredRichTextState();
}

class _ColoredRichTextState extends State<ColoredRichText> {
  @override
  Widget build(BuildContext context) {
    var toUserName = '花花';
    toUserName = null;
    var content = '一款优雅高效的在线文档编辑与协一款优雅高效的在线文档编辑与协一款优雅高效的在线文档编辑与协一款优雅高效的在线文档编辑与协';
    var hasToUserNameText = Container(
          color: Colors.white,
          child: RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: '回复',
              style: TextStyle(color: Color(0xFF333333), fontSize: 14),
              children: <TextSpan>[
                TextSpan(
                    text: toUserName,
                    style: TextStyle(color: Color(0xFFF6A637), fontSize: 14)),
                TextSpan(
                    text: '：',
                    style: TextStyle(color: Color(0xFF333333), fontSize: 14)),
                TextSpan(
                    text: content,
                    style: TextStyle(color: Color(0xFF333333), fontSize: 14)),
              ],
            ),
          ),
        );
    var commonText = Text(content, style: TextStyle(color: Color(0xFF333333), fontSize: 14));
    return Scaffold(
        appBar: AppBar(
          title: Text("rich text"),
        ),
        body: getShowContent(toUserName, commonText, hasToUserNameText)
    );
  }

  StatelessWidget getShowContent(String toUserName, Text commonText, Container hasToUserNameText) => toUserName == null ? commonText :hasToUserNameText;
}
