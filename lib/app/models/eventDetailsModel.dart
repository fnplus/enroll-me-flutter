class EventDetailsModel {
  final String eventName;
  final int eventRSVPLimit;
  final String eventStatus;
  final String eventRSVPConfirmed;
  final String groupName;
  final String groupLocation;
  final String groupmeetupPageLink;
  final String eventDescription;

  EventDetailsModel(
      {this.eventName,
      this.eventRSVPLimit,
      this.eventStatus,
      this.eventRSVPConfirmed,
      this.groupName,
      this.groupLocation,
      this.groupmeetupPageLink,
      this.eventDescription});

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) {
    return EventDetailsModel(
      eventName: json['name'],
      eventRSVPLimit: json['rsvp_limit'],
      eventStatus: json['status'],
      eventRSVPConfirmed: json['yes_rsvp_count'],
      groupName: json['group']['name'],
      groupLocation: json['group']['localized_location'],
      groupmeetupPageLink: json['link'],
      eventDescription: json['description'],
    );
  }
}
