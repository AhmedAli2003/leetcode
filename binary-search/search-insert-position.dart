// https://leetcode.com/problems/search-insert-position/

/*
Question:
  Given a sorted array of distinct integers and a target value,return the index
  if the target is found. If not, return the index where it would be if it were inserted in order.

  You must write an algorithm with O(log n) runtime complexity.

  Example 1:
  Input: nums = [1,3,5,6], target = 5
  Output: 2

  Example 2:
  Input: nums = [1,3,5,6], target = 2
  Output: 1

  Example 3:
  Input: nums = [1,3,5,6], target = 7
  Output: 4
*/

/*
Answer:
  - We initialize two pointers low and high, representing the current search range within the array.
  - In each step, we calculate the mid index.
  - If nums[mid] == target, we return mid because the target is found.
  - If nums[mid] < target, we move low to mid + 1 to search the right half.
  - If nums[mid] > target, we move high to mid - 1 to search the left half.
  - If the target is not found in the array, the low pointer will indicate the
    correct index where the target should be inserted, so we return low.
  - This approach has a time complexity of O(log n) as required by the problem.
*/

int searchInsert(List<int> nums, int target) {
  int start = 0;
  int end = nums.length - 1;

  while (start <= end) {
    // Get the mid
    int mid = start + (end - start) ~/ 2;

    if (nums[mid] < target) {
      start = mid + 1;
    } else if (nums[mid] > target) {
      end = mid - 1;
    } else {
      return mid;
    }
  }

  // If the target is not found, return the index where it should be inserted
  // Its the index of the first greater number
  return start;
}
