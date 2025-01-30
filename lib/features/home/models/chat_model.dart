class ChatModel {
 
  
  final String? msg;
  final String? id;
  final DateTime? time;
  final String? lastMsg;
  final DateTime? lastMsgTime;

  ChatModel({
    
    
    this.msg,
    this.id,
    this.time,
    this.lastMsg,
    this.lastMsgTime
  });

  ChatModel copyWith({
   
    
    String? msg,
     String? id,
    DateTime? time,
    DateTime? lastMsgTime,
    String? lastMsg,
    
  }) =>
      ChatModel(
        
        
        msg: msg ?? this.msg,
        id: id ?? this.id,
        time: time ?? this.time,
        lastMsg: lastMsg ?? this.lastMsg,
        lastMsgTime: lastMsgTime ?? this.lastMsgTime
      );

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
      
        
        msg: json["msg"],
        id: json["id"],
        lastMsg: json["lastMsg"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        lastMsgTime: json["lastMsgTime"] == null
            ? null
            : DateTime.parse(json["lastMsgTime"]),
      );

  Map<String, dynamic> toJson() => {
       
        
        "msg": msg,
           "id": id,
        "time": time?.toIso8601String(),
         "lastMsg": lastMsg,
        "lastMsgTime": lastMsgTime?.toIso8601String(),
      };
}