// https://leetcode.com/problems/sqrtx/

/*
Question:
  Given a non-negative integer x, return the square root of x rounded down to the nearest integer.
  The returned integer should be non-negative as well.
  You must not use any built-in exponent function or operator.

  Example 1:

  Input: x = 4
  Output: 2
  Explanation: The square root of 4 is 2, so we return 2.

  Example 2:

  Input: x = 8
  Output: 2
  Explanation: The square root of 8 is 2.82842...,
  and since we round it down to the nearest integer, 2 is returned.
*/


/*
Answer:
  - If x is 0 or 1, we return x immediately as these are edge cases.
  - We use binary search between 1 and x.
  - For each mid value, we check if mid * mid is equal to x. If it is, we return mid.
  - If mid * mid is less than x, we move to the right part and store the current mid as the result.
  - If mid * mid is more than x, we move to the left part.
  - Finally, we return the last valid mid value, which is the square root rounded down.

  This solution runs in logarithmic time, O(log x), making it efficient for large inputs.
*/

int mySqrt(int x) {
  if (x == 0 || x == 1) return x;

  int start = 1;
  int end = x;
  int result = 0;

  while (start <= end) {
    // Get the mid value
    int mid = start + (end - start) ~/ 2;

    // If mid^2 is equal to x, return mid as the square root
    if (mid * mid == x) {
      return mid;
    }

    if (mid * mid < x) {
      // If mid^2 is less than x, move to the right part
      start = mid + 1;

      // Store the result because we are rounding down
      result = mid;
    } else {
      // If mid^2 is more than x, move to the left part
      end = mid - 1;
    }
  }

  // Return the nearest integer to the calculated square root
  return result;
}
