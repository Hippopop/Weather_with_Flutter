class TimeFormatter {
  DateTime unformatted;
  String? date;
  String? time;
  String? hour;
  String? sortedTime;
  String? sortedDate;
  List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  TimeFormatter({required this.unformatted}) {
    final String string = unformatted.toString();
    date = string.substring(0, 10);
    time = string.substring(11, 16);
    sortedTime = convertTime(time!);
    sortedDate = convertDate(unformatted);
    hour = takeHour(sortedTime!);
  }

  String convertTime(String twentyFour) {
    String hour = twentyFour.substring(0, 2);
    String minute = twentyFour.substring(3);
    if (hour == "00") {
      hour = "12";
      minute = "$minute AM";
      return "$hour:$minute";
    } else if (int.parse(hour) >= 12) {
      hour = (int.parse(hour) - 12).toString();
      minute = "$minute PM";
      return "$hour:$minute";
    } else {
      minute = "$minute AM";
      return "$hour:$minute";
    }
  }

  String convertDate(DateTime date) {
    return "${days[date.weekday - 1]}, ${date.day} ${months[date.month - 1]}";
  }

  String takeHour(String time) {
    final int hour = int.parse(time.substring(0, time.indexOf(":")));
    final String sub = time.substring(time.length - 2);
    return "$hour$sub";
  }

  factory TimeFormatter.fromUnix(int unix) {
    final DateTime converted = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
    return TimeFormatter(unformatted: converted);
  }
}
