// https://leetcode.com/problems/lexicographical-numbers/

/* Question - Medium
  Given an integer n, return all the numbers in the range [1, n] sorted in lexicographical order.

  You must write an algorithm that runs in O(n) time and uses O(1) extra space. 

  Example 1:
  Input: n = 13
  Output: [1,10,11,12,13,2,3,4,5,6,7,8,9]

  Example 2:
  Input: n = 2
  Output: [1,2]
*/

/* Explanation
  Start with current = 1, and each iteration adds the current number to the result list.
  If current * 10 <= n, move to the next number at the lower lexicographical level (append a '0').
  Otherwise, increment the number unless it ends in '9' or would exceed n.
  When that happens, move up to the next number by dividing current by 10 until it's valid to increment.
  This algorithm ensures that the numbers are generated in lexicographical order while
  maintaining O(n) time complexity and O(1) space usage.
*/

List<int> lexicalOrder(int n) {
  final result = <int>[];
  int current = 1;

  for (int i = 0; i < n; ++i) {
    result.add(current);

    // Try moving to the next lexicographical number
    if (current * 10 <= n) {
      current *= 10;
    } else {
      // Otherwise, increment the current number
      while (current % 10 == 9 || current + 1 > n) {
        current ~/= 10; // Move up a level when the current number ends in 9
      }
      current++;
    }
  }

  return result;
}
