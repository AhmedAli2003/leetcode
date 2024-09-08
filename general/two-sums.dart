// https://leetcode.com/problems/two-sum/

/* Question - Easy
Given an array of integers nums and an integer target,
return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution,
and you may not use the same element twice.

You can return the answer in any order. 

Example 1:
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

Example 2:
Input: nums = [3,2,4], target = 6
Output: [1,2]

Example 3:
Input: nums = [3,3], target = 6
Output: [0,1]
*/

List<int> twoSum(List<int> nums, int target) {
  // This HashMap will store the nums in the array and their indexes
  final map = <int, int>{};

  // Iterate over the array
  for (int i = 0; i < nums.length; ++i) {
    // Get the complement of the current value
    final comp = target - nums[i];

    // Check if the complement of the current value is already in the map
    if (map[comp] == null) {
      // If not, add the current value to the map with its index
      map[nums[i]] = i;
    } else {
      // If it is, return the indexes of the complement and the current value
      return [map[comp]!, i];
    }
  }
  return [];
}
