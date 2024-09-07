// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array

/* Question
Given an array of integers nums sorted in non-decreasing order,
find the starting and ending position of a given target value.

If target is not found in the array, return [-1, -1].

You must write an algorithm with O(log n) runtime complexity.

Example 1:
Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]

Example 2:
Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]

Example 3:
Input: nums = [], target = 0
Output: [-1,-1]
*/

List<int> searchRange(List<int> nums, int target) {
  // Find the first occurrence of the target
  final first = binarySearch(nums, target, true);

  // If the target is not found, return [-1, -1]
  if (first == -1) {
    return [-1, -1];
  }

  // Find the last occurrence of the target and return the first and last occurrence
  return [first, binarySearch(nums, target, false)];
}

int binarySearch(List<int> nums, int target, bool isFirst) {
  int start = 0;
  int end = nums.length - 1;

  // If the element is not found we will return -1
  int answer = -1;

  while (start <= end) {
    final mid = start + (end - start) ~/ 2;

    if (nums[mid] < target) {
      start = mid + 1;
    } else if (nums[mid] > target) {
      end = mid - 1;
    } else {
      // potential answer
      answer = mid;
      // Adjust the search direction based on the requirement (first or last occurrence)
      if (isFirst) {
        end = mid - 1;
      } else {
        start = mid + 1;
      }
    }
  }

  return answer;
}
