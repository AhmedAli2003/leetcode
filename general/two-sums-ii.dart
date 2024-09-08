//https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

/* Question - Medium
  Given a 1-indexed array of integers numbers that is already sorted in
  non-decreasing order, find two numbers such that they add up to a specific
  target number. Let these two numbers be numbers[index1] and numbers[index2]
  where 1 <= index1 < index2 <= numbers.length.

  Return the indices of the two numbers, index1 and index2,
  added by one as an integer array [index1, index2] of length 2.

  The tests are generated such that there is exactly one solution.
  You may not use the same element twice.

  Your solution must use only constant extra space.

  Example 1:
  Input: numbers = [2,7,11,15], target = 9
  Output: [1,2]
  Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2.
  We return [1, 2].

  Example 2:
  Input: numbers = [2,3,4], target = 6
  Output: [1,3]
  Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3.
  We return [1, 3].

  Example 3:
  Input: numbers = [-1,0], target = -1
  Output: [1,2]
  Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2.
  We return [1, 2].
*/

List<int> twoSum(List<int> numbers, int target) {
  int p1 = 0;
  int p2 = numbers.length - 1;

  while (p1 < p2) {
    // Get the sum of the two numbers
    final sum = numbers[p1] + numbers[p2];

    // If the sum is equal to the target, return their indices
    if (sum == target) return [p1 + 1, p2 + 1];

    // If the sum is greater than the target,
    // move the left pointer to the right
    if (sum > target) {
      --p2;
    } else {
      ++p1;
    }
  }
  return [];
}

// ------------------------------------------------------------------------------------------

// My Idea: To Enhance the performance by getting the greatest number that
// is less than the target, and start p2 from its index.
// We can find it using binary search since that the array is sorted -> O(log(n))

int binarySearch(List<int> numbers, int target) {
  int start = 0;
  int end = numbers.length - 1;

  while (start <= end) {
    final mid = start + (end - start) ~/ 2;

    // Find the largest number strictly less than the target
    if (numbers[mid] >= target) {
      end = mid - 1;
    } else {
      start = mid + 1;
    }
  }

  // Return the greatest index where numbers[end] is strictly less than target
  return end;
}

List<int> twoSumEnhanced(List<int> numbers, int target) {
  int p1 = 0;
  int p2 = binarySearch(numbers, target);

  while (p1 < p2) {
    // Get the sum of the two numbers
    final sum = numbers[p1] + numbers[p2];

    // If the sum is equal to the target, return their indices
    if (sum == target) return [p1 + 1, p2 + 1];

    // If the sum is greater than the target,
    // move the left pointer to the right
    if (sum > target) {
      --p2;
    } else {
      ++p1;
    }
  }
  return [];
}
