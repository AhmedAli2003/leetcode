// https://leetcode.com/problems/find-peak-element/

/* Question (Medium)
  A peak element is an element that is strictly greater than its neighbors.

  Given a 0-indexed integer array nums, find a peak element, and return its index.
  If the array contains multiple peaks, return the index to any of the peaks.

  You may imagine that nums[-1] = nums[n] = -∞. In other words, an element is always
  considered to be strictly greater than a neighbor that is outside the array.

  You must write an algorithm that runs in O(log n) time.

  Example 1:
  Input: nums = [1,2,3,1]
  Output: 2
  Explanation: 3 is a peak element and your function should return the index number 2.

  Example 2:
  Input: nums = [1,2,1,3,5,6,4]
  Output: 5
  Explanation: Your function can return either index number 1 where the peak element is 2,
  or index number 5 where the peak element is 6.
*/

int findPeakElement(List<int> arr) {
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
