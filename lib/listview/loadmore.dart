import 'dart:async';

import 'package:flutter/material.dart';

class ListviewLoadMore extends StatefulWidget {
  @override
  _ListviewLoadMoreState createState() => _ListviewLoadMoreState();
}

class _ListviewLoadMoreState extends State<ListviewLoadMore> {
//  List<int> items = List.generate(10, (i) => i);
  List<int> items = List<int>();
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;

  Widget get emptyView => Center(child: Text("暂无数据",style: TextStyle(color: Colors.red,fontSize: 18),),);

  @override
  void initState() {
    super.initState();
    // 延迟一秒加载
    new Future.delayed(Duration(seconds: 1), () {
      _getMoreData();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _getMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      List<int> newEntries = await fakeRequest(
          items.length, items.length + 10);
      if (newEntries.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent -
            _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge - offsetFromBottom),
              duration: new Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }
      setState(() {
        items.addAll(newEntries);
        isPerformingRequest = false;
      });
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var itemCount = items.length + 1;
    return new Scaffold(
      appBar: AppBar(
        title: Text("Infinite ListView"),
      ),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if(index==0&&itemCount==1){
            return emptyView;
          }
          if (index == items.length) {
            return _buildProgressIndicator();
          } else {
            return ListTile(title: new Text("Number $index"));
          }
        },
        controller: _scrollController,
      ),
    );
  }
}

/// from - inclusive, to - exclusive
Future<List<int>> fakeRequest(int from, int to) async {
  return Future.delayed(Duration(seconds: 2), () {
    return List.generate(to - from, (i) => i + from);
  });
}
