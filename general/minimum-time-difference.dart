// https://leetcode.com/problems/minimum-time-difference/

/* Question - Medium
  Given a list of 24-hour clock time points in "HH:MM" format,
  return the minimum minutes difference between any two time-points in the list. 

  Example 1:
  Input: timePoints = ["23:59","00:00"]
  Output: 1

  Example 2:
  Input: timePoints = ["00:00","23:59","00:00"]
  Output: 0
*/

import 'dart:math';

int findMinDifference(List<String> timePoints) {
  if (timePoints.length > 1440) {
    // If there are more than 1440 time points, there must be duplicates.
    return 0;
  }

  // Convert each time point to minutes since 00:00 and mark it in a boolean array
  final minutesArray = List<bool>.filled(1440, false);

  for (final time in timePoints) {
    final split = time.split(':');
    final totalMinutes = int.parse(split[0]) * 60 + int.parse(split[1]);

    // If the time point has already been seen, return 0 because it would have 0 minutes difference
    if (minutesArray[totalMinutes]) {
      return 0;
    }
    minutesArray[totalMinutes] = true;
  }

  // Find the first and last time points and calculate minimum difference
  int prev = -1;
  int first = -1;
  int last = -1;
  int minDifference = 1440;

  for (int i = 0; i < 1440; ++i) {
    if (minutesArray[i]) {
      if (first == -1) {
        first = i;
      }
      if (prev != -1) {
        minDifference = min(minDifference, i - prev);
      }
      prev = i;
      last = i;
    }
  }

  // Check the difference between the last and first time points (crossing midnight)
  minDifference = min(minDifference, (1440 - last + first));

  return minDifference;
}
