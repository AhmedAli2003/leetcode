// https://leetcode.com/problems/search-in-rotated-sorted-array/

int search(List<int> nums, int target) {
  if (nums.length == 1) {
    if (target == nums[0])
      return 0;
    else
      return -1;
  }

  if (nums.length == 2) {
    if (target == nums[0]) return 0;
    if (target == nums[1]) return 1;
    return -1;
  }

  if (target < nums[0] && target > nums[nums.length - 1]) {
    return -1;
  }

  final peak = getPeak(nums);
  if (peak == target) return peak;

  if (target < nums[0]) {
    return binarySearch(nums, target, peak + 1, nums.length - 1);
  } else {
    return binarySearch(nums, target, 0, peak);
  }
}

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

int getPeak(List<int> nums) {
  int start = 0;
  int end = nums.length - 1;

  while (start < end) {
    final mid = start + (end - start) ~/ 2;

    if (nums[mid] > nums[mid + 1]) {
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

void main() {
  print(search([1, 3], 1));
}
