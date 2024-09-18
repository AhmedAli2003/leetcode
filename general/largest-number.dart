// https://leetcode.com/problems/largest-number/

/* Question - Medium
  Given a list of non-negative integers nums,
  arrange them such that they form the largest number and return it.

  Since the result may be very large, so you need to return a string instead of an integer.

  Example 1:
  Input: nums = [10,2]
  Output: "210"

  Example 2:
  Input: nums = [3,30,34,5,9]
  Output: "9534330"
*/

String largestNumber(List<int> nums) {
  // Convert the integers to strings for easier comparison
  final numStrs = nums.map<String>((e) => e.toString()).toList();

  // Custom sort comparator that sorts based on which combination forms a larger number
  numStrs.sort((a, b) => (b + a).compareTo(a + b)); // Sort in descending order

  // Edge case: If the largest number is 0, the result is "0"
  if (numStrs[0] == '0') {
    return '0';
  }

  // Join all the numbers to form the largest number
  return numStrs.join('');
}

void main() {
  print(largestNumber([3, 30, 34, 5, 9]));
}
