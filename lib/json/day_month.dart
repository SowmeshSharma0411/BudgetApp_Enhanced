class DayMonth {
  List days = [
    {"label": "Sun", "day": "28"},
    {"label": "Mon", "day": "29"},
    {"label": "Tue", "day": "30"},
    {"label": "Wed", "day": "1"},
    {"label": "Thu", "day": "2"},
    {"label": "Fri", "day": "3"},
    {"label": "Sat", "day": "4"},
  ];

  List months = []; //trouble with thsi shit.
  List<String> Months = [
    "Jan",
    "Feb",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];
  void main(List<String> args) {
    int i = 0;
    for (i = 1990; i <= 2090; i++) {
      for (int c = 0; c < 12; c++)
        months.add({"label": i.toString(), "day": Months[c]});
    }
  }
}
