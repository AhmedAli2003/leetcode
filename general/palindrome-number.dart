// https://leetcode.com/problems/palindrome-number/

/*
  Given an integer x, return true if x is a palindrome, and false otherwise.

  Example 1:
  Input: x = 121
  Output: true
  Explanation: 121 reads as 121 from left to right and from right to left.

  Example 2:
  Input: x = -121
  Output: false
  Explanation: From left to right, it reads -121. From right to left, it becomes 121-.
  Therefore it is not a palindrome.

  Example 3:
  Input: x = 10
  Output: false
  Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
*/

bool isPalindrome(int x) {
  // Negative numbers are not palindromes
  if (x < 0) return false;

  // Initialize variables to reverse the number
  int original = x;
  int reversed = 0;

  // Reverse the number
  while (x != 0) {
    reversed = reversed * 10 + x % 10; // Append the last digit to the reversed number
    x ~/= 10; // Remove the last digit from x
  }

  // Check if the original number is equal to its reverse
  return original == reversed;
}

// Optimization to only reverse the half of the number
bool isPalindromeOptimized(int x) {
  // Negative numbers are not palindromes
  // Numbers that are divisible by 10 are not palindromes
  if (x < 0 || (x % 10 == 0 && x != 0)) {
    return false;
  }

  int reversedHalf = 0;

  // Reverse half of the number
  while (x > reversedHalf) {
    reversedHalf = reversedHalf * 10 + x % 10;
    x ~/= 10;
  }

  // Check if the first half is equal to the reversed second half
  // When the length is odd, we remove the middle digit by reversedHalf ~/ 10
  return x == reversedHalf || x == reversedHalf ~/ 10;
}
