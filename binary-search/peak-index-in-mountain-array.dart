// https://leetcode.com/problems/peak-index-in-a-mountain-array/

/*
You are given an integer mountain array arr of length n where the values
increase to a peak element and then decrease.

Return the index of the peak element.

Your task is to solve it in O(log(n)) time complexity.

Example 1:
Input: arr = [0,1,0]
Output: 1

Example 2:
Input: arr = [0,2,1,0]
Output: 1

Example 3:
Input: arr = [0,10,5,2]
Output: 1
*/

// My Solution: Beats 100%
int peakIndexInMountainArray(List<int> arr) {
  int start = 0;
  int end = arr.length - 1;

  while (start <= end) {
    int mid = start + (end - start) ~/ 2;

    if (mid == 0) ++mid;
    if (mid == arr.length) --mid;

    // Check if current element is a peak
    if (arr[mid] > arr[mid - 1] && arr[mid] > arr[mid + 1]) {
      return mid;
    }

    // If we are in ascending order, then start = mid + 1, else end = mid - 1
    if (arr[mid] > arr[mid - 1]) {
      start = mid + 1;
    } else {
      end = mid - 1;
    }
  }

  return -1; // No peak found
}

// Other Solution:

int peakIndexInMountainArrayOther(List<int> arr) {
  int start = 0;
  int end = arr.length - 1;

  while (start < end) {
    final mid = start + (end - start) ~/ 2;

    if (arr[mid] > arr[mid + 1]) {
      // possible peak, this may be the answer, this is why end != mid + 1
      end = mid;
    } else {
      // not peak, search in the right half
      start = mid + 1;
    }
  }

  // start and end were trying to reduce the array to get the peak value
  return start; // or return end, because here start and end are the same
}
