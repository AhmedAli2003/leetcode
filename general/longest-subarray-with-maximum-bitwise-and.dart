// https://leetcode.com/problems/longest-subarray-with-maximum-bitwise-and/

/* Question - Medium
  You are given an integer array nums of size n.
  Consider a non-empty subarray from nums that has the maximum possible bitwise AND.
  In other words, let k be the maximum value of the bitwise AND of any subarray of nums.
  Then, only subarrays with a bitwise AND equal to k should be considered.
  Return the length of the longest such subarray.

  The bitwise AND of an array is the bitwise AND of all the numbers in it.

  A subarray is a contiguous sequence of elements within an array.

  Example 1:
  Input: nums = [1,2,3,3,2,2]
  Output: 2
  Explanation:
  The maximum possible bitwise AND of a subarray is 3.
  The longest subarray with that value is [3,3], so we return 2.

  Example 2:
  Input: nums = [1,2,3,4]
  Output: 1
  Explanation:
  The maximum possible bitwise AND of a subarray is 4.
  The longest subarray with that value is [4], so we return 1.
*/

/* Explaination
  - When we perform bitwise & between two numbers, then the result will always be smaller than the greatest number.
  - The greatest result we can achieve is when we perform & operation between two equal numbers.
  - So, to solve the problem, we should find the largest number and find the longest sub-array of that number.  
*/

int longestSubarray(List<int> nums) {
  int max = nums[0];

  // Find the max value in the array
  for (final num in nums) {
    if (num > max) {
      max = num;
    }
  }

  // To store the length of the longest subarray
  int maxLength = 0;
  // To track the current subarray length
  int currentLength = 0;

  // Now, count the longest contiguous subarray of the max value
  for (final num in nums) {
    if (num == max) {
      currentLength++; // Keep counting if the current number equals the max
      maxLength = currentLength > maxLength ? currentLength : maxLength;
    } else {
      currentLength = 0; // Reset the count if the number is different
    }
  }

  return maxLength;
}
