// https://leetcode.com/problems/search-in-rotated-sorted-array/

/* Question - Medium
  There is an integer array nums sorted in ascending order (with distinct values).

  Prior to being passed to your function, nums is possibly rotated at an unknown
  pivot index k (1 <= k < nums.length) such that the resulting array is
  [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed).
  For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

  Given the array nums after the possible rotation and an integer target,
  return the index of target if it is in nums, or -1 if it is not in nums.

  You must write an algorithm with O(log n) runtime complexity.

  Example 1:
  Input: nums = [4,5,6,7,0,1,2], target = 0
  Output: 4

  Example 2:
  Input: nums = [4,5,6,7,0,1,2], target = 3
  Output: -1

  Example 3:
  Input: nums = [1], target = 0
  Output: -1
*/

int search(List<int> nums, int target) {
  // Get the pivot
  final pivot = getPivot(nums);

  // If there is no pivot, do normal binary search
  if (pivot == -1) {
    return binarySearch(nums, target, 0, nums.length - 1);
  }

  // We need the first element in the array
  final first = nums.first;
  if (target == first) return 0; // to better performance
  if (target == nums[pivot]) return pivot; // to better performance

  // If the target is greater than the first element, then it is in the first half of the array
  // Else, it will be in the second half of the array
  if (target > first) {
    return binarySearch(nums, target, 0, pivot);
  } else {
    return binarySearch(nums, target, pivot + 1, nums.length - 1);
  }
}

// Normal binary search
int binarySearch(List<int> nums, int target, int start, int end) {
  while (start <= end) {
    final mid = start + (end - start) ~/ 2;

    if (nums[mid] > target) {
      end = mid - 1;
    } else if (nums[mid] < target) {
      start = mid + 1;
    } else {
      return mid;
    }
  }
  return -1;
}

// Find the pivot index
int getPivot(List<int> nums) {
  int start = 0;
  int end = nums.length - 1;

  // The first element will help us to determine if we are in the first or second half
  int first = nums.first;

  while (start <= end) {
    final mid = start + (end - start) ~/ 2;

    // We need to make sure that mid + 1 is in the array bounds
    // If nums[mid] is greater than nums[mid + 1], then this is the pivot
    if ((mid + 1) <= (nums.length - 1) && nums[mid] > nums[mid + 1]) {
      return mid;
    } else {
      // If nums[mid] >= first, then we are in the first half, and we need to go left
      if (nums[mid] >= first) {
        start = mid + 1;
      } else {
        // We are in the second half, and we need to go right
        end = mid - 1;
      }
    }
  }
  return -1;
}

void main() {
  final nums = [8, 9, 2, 3, 4];
  print(getPivot(nums));
}
