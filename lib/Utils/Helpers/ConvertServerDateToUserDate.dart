class ConvertServerDateToUserDate {
  
  convertServerDateToReadableFormate(String? createAtstring) {
  
    if (createAtstring == null || createAtstring.isEmpty) {
      createAtstring = DateTime.now().toIso8601String();
    }
    String? timeAgo;

    try {
      DateTime postDateTime = DateTime.parse(createAtstring);
      DateTime now = DateTime.now();
      Duration difference = now.difference(postDateTime);
      if (difference.inDays > 365) {
        timeAgo = '${(difference.inDays / 365).floor()} years ago';
      } else if (difference.inDays > 30) {
        timeAgo = '${(difference.inDays / 30).floor()} months ago';
      } else if (difference.inDays > 7) {
        timeAgo = '${(difference.inDays / 7).floor()} weeks ago';
      } else if (difference.inDays > 0) {
        timeAgo = '${difference.inDays} days ago';
      } else if (difference.inHours > 0) {
        timeAgo = '${difference.inHours} hours ago';
      } else if (difference.inMinutes > 0) {
        timeAgo = '${difference.inMinutes} minutes ago';
      } else {
        timeAgo = '${difference.inSeconds} seconds ago';
      }
      print("Time ago: $timeAgo");
      return timeAgo;
    } catch (e) {
      print("Error parsing date: $e");
      String timeAgo = 'Unknown';
    }
  }
}