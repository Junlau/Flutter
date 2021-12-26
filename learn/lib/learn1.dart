import 'package:flutter/material.dart';

class UpdateItemModel {
  String? appIcon; //App 图标
  String? appName; //App 名字
  String? appSize; //App 大小
  String? appDate; //App 更新时间
  String? appDescription; //App 说明
  String? appVersion; //App 版本
  UpdateItemModel({this.appIcon, this.appName, this.appSize, this.appDate, this.appDescription, this.appVersion});
}

class UpdateItemWidget extends StatelessWidget {
  final UpdateItemModel? model;
  const UpdateItemWidget({Key? key,this.model,this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildTopRow(context),
        buildBottomView(context)
      ],
    );
  }

  Widget buildTopRow (BuildContext context) {
    return Row(children: <Widget>[
      Padding(padding: EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(model!.appIcon!,width: 80,height: 80),
          )
      ),
      Expanded(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(model!.appName!,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 20, color: Color(0xFF8E8D92))),
          Text(model!.appDate!,maxLines: 1, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16, color: Color(0xFF8E8D92)))
        ],
      )),
      Padding(padding: EdgeInsets.fromLTRB(0,0,10,0),
        child: TextButton(onPressed: onPressed,
          style:ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey),
                shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)))),
          child: Text('Open'),))
    ],);
  }

  Widget buildBottomView (BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(model!.appDescription!),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("${model!.appVersion!} • ${model!.appSize!}MB"),)
        ],)
      ,);
  }
}