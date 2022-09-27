import 'package:json_annotation/json_annotation.dart';
import 'package:kafegama/model/common/links.dart';
import 'package:kafegama/model/common/meta.dart';

import 'event.dart';

part 'event_list.g.dart';

@JsonSerializable()
class EventList {
  List<Event>? data;
  Links? links;
  Meta? meta;
  String? error;

  EventList({this.data, this.links, this.meta, this.error});

  factory EventList.fromJson(Map<String, dynamic> json) {
    return _$EventListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EventListToJson(this);
  EventList.withError(String errorValue)
      : data = null,
        error = errorValue;
}
