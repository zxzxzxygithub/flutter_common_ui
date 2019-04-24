import 'package:flutter/material.dart';
import 'package:flutter_ui_common/constants.dart';

class InheriedWidgetTester extends StatefulWidget {
  @override
  _InheriedWidgetTesterState createState() => _InheriedWidgetTesterState();
}

class _InheriedWidgetTesterState extends State<InheriedWidgetTester> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var testModel = TestModel(age: 1);
    var scaffold = new Scaffold(
        appBar: AppBar(title: Text("test inheriedwidget")),
        body: Column(
          children: <Widget>[InheriedWidgetA(), InheriedWidgetB()],
        ),
      );
    var testModelQuery = _TestModelQuery(
      data: testModel,
      child: scaffold,
    );
    return testModelQuery;
  }
}

class InheriedWidgetA extends StatefulWidget {
  @override
  _InheriedWidgetAState createState() => _InheriedWidgetAState();
}

var data = "显示修改的age";
class _InheriedWidgetAState extends State<InheriedWidgetA> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      color: white,
      child: RaisedButton(
          child: Text(
            data,
            style: TextStyle(color: black, fontSize: 15),
          ),
          onPressed: () {
            int age = _TestModelQuery.of(context).age;
            print('修改 的age'+age.toString());
            setState(() {
              data = age.toString();
            });
          }),
    );
  }
}

class InheriedWidgetB extends StatefulWidget {
  @override
  _InheriedWidgetBState createState() => _InheriedWidgetBState();
}

class _InheriedWidgetBState extends State<InheriedWidgetB> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      color: white,
      child: RaisedButton(
          child: Text(
            "修改age为9",
            style: TextStyle(color: black, fontSize: 15),
          ),
          onPressed: () {
            var testModel = _TestModelQuery.of(context);
            testModel.age = 9;
          }),
    );
  }
}

class TestModel {
   TestModel({this.age});

  var age;
}

class _TestModelQuery extends InheritedWidget {
  const _TestModelQuery({Key key, this.data, Widget child}) : super(key: key, child: child);
  final TestModel data;

  /// 获取共享数据
  static TestModel of(BuildContext context) {
    _TestModelQuery query =
        context.inheritFromWidgetOfExactType(_TestModelQuery);
    return query.data;
  }

  @override
  bool updateShouldNotify(_TestModelQuery oldWidget) =>
      data.age != oldWidget.data.age;
}
