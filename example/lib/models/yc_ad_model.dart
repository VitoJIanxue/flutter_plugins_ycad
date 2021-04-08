class YXADBean {
  int statusCode;
  String statusMsg;
  Result result;
  int type;
  int pid;

  YXADBean({this.statusCode, this.statusMsg, this.result, this.type, this.pid});

  YXADBean.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMsg = json['statusMsg'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    type = json['type'];
    pid = json['pid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['statusMsg'] = this.statusMsg;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['type'] = this.type;
    data['pid'] = this.pid;
    return data;
  }
}

class Result {
  String brandId;
  String serialId;
  int creativeid;
  String packUrl;
  String clickTrack;
  String url;
  String carid;
  String packName;
  String order;
  int evtType;
  String clickTp;
  String exposureTp;
  String tempId;
  String videoUrl;
  String content;
  String title;
  ExtData extData;
  String summary;
  String picUrl;
  String showtime;
  String appId;

  Result(
      {this.brandId,
        this.serialId,
        this.creativeid,
        this.packUrl,
        this.clickTrack,
        this.url,
        this.carid,
        this.packName,
        this.order,
        this.evtType,
        this.clickTp,
        this.exposureTp,
        this.tempId,
        this.videoUrl,
        this.content,
        this.title,
        this.extData,
        this.summary,
        this.picUrl,
        this.showtime,
        this.appId});

  Result.fromJson(Map<String, dynamic> json) {
    brandId = json['brandId'];
    serialId = json['serialId'];
    creativeid = json['creativeid'];
    packUrl = json['packUrl'];
    clickTrack = json['clickTrack'];
    url = json['url'];
    carid = json['carid'];
    packName = json['packName'];
    order = json['order'];
    evtType = json['evtType'];
    clickTp = json['clickTp'];
    exposureTp = json['exposureTp'];
    tempId = json['tempId'];
    videoUrl = json['videoUrl'];
    content = json['content'];
    title = json['title'];
    extData =
    json['extData'] != null ? new ExtData.fromJson(json['extData']) : null;
    summary = json['summary'];
    picUrl = json['picUrl'];
    showtime = json['showtime'];
    appId = json['appId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brandId'] = this.brandId;
    data['serialId'] = this.serialId;
    data['creativeid'] = this.creativeid;
    data['packUrl'] = this.packUrl;
    data['clickTrack'] = this.clickTrack;
    data['url'] = this.url;
    data['carid'] = this.carid;
    data['packName'] = this.packName;
    data['order'] = this.order;
    data['evtType'] = this.evtType;
    data['clickTp'] = this.clickTp;
    data['exposureTp'] = this.exposureTp;
    data['tempId'] = this.tempId;
    data['videoUrl'] = this.videoUrl;
    data['content'] = this.content;
    data['title'] = this.title;
    if (this.extData != null) {
      data['extData'] = this.extData.toJson();
    }
    data['summary'] = this.summary;
    data['picUrl'] = this.picUrl;
    data['showtime'] = this.showtime;
    data['appId'] = this.appId;
    return data;
  }
}

class ExtData {
  String dealerName;
  String dealerPhone;
  String bigimgUrl;
  String btnUrl;
  String bigimgLinkUrl;
  String btnLinkUrl;

  ExtData(
      {this.dealerName,
        this.dealerPhone,
        this.bigimgUrl,
        this.btnUrl,
        this.bigimgLinkUrl,
        this.btnLinkUrl});

  ExtData.fromJson(Map<String, dynamic> json) {
    dealerName = json['dealerName'];
    dealerPhone = json['dealerPhone'];
    bigimgUrl = json['bigimgUrl'];
    btnUrl = json['btnUrl'];
    bigimgLinkUrl = json['bigimgLinkUrl'];
    btnLinkUrl = json['btnLinkUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dealerName'] = this.dealerName;
    data['dealerPhone'] = this.dealerPhone;
    data['bigimgUrl'] = this.bigimgUrl;
    data['btnUrl'] = this.btnUrl;
    data['bigimgLinkUrl'] = this.bigimgLinkUrl;
    data['btnLinkUrl'] = this.btnLinkUrl;
    return data;
  }
}