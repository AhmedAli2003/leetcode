// https://leetcode.com/problems/longest-substring-without-repeating-characters/

/* Question - Medium
  Given a string s, find the length of the longest substring without repeating characters.

  Example 1:
  Input: s = "abcabcbb"
  Output: 3
  Explanation: The answer is "abc", with the length of 3.

  Example 2:
  Input: s = "bbbbb"
  Output: 1
  Explanation: The answer is "b", with the length of 1.

  Example 3:
  Input: s = "pwwkew"
  Output: 3
  Explanation: The answer is "wke", with the length of 3.

  Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
*/
// ---------------------------------------------------------------------------------------------------------------------
/* Answer
  Detailed Solution Using Sliding Window:
  Step 1: Understanding the Sliding Window Technique
  The sliding window technique helps us maintain a range or window of characters
  in the string where no characters repeat.
  We expand the window by moving a pointer (right pointer) and adjust the window
  (by moving the left pointer)whenever we encounter a repeating character.

  - We use two pointers, left and right. These pointers represent the boundaries of our window.
  - [left] represents the start of the current window (substring),
    and [right] represents the end of the window (substring).
  - We also use a Set to keep track of unique characters in the current window.
  - Sets allow efficient checking for duplicates and removal of elements.

  Step 2: Initial Setup
  We start with:
  - left = 0: This is the starting index of our current window.
  - right = 0: This is the index that expands the window by moving forward.
  - Set<String> unique: This set will store unique characters in the window.
  - maxLength = 0: This will keep track of the longest substring length.

  Step 3: Expanding the Window
  We iterate through the string using the right pointer. On each iteration:
  - If s[right] (the character at the right pointer) is not in the set unique, it means there is no duplicate,
    so we add the character to the set and continue expanding the window by moving right one step further.
  - If s[right] is already in the set, it means there's a duplicate character in the current window.
    To resolve this, we need to shrink the window by moving the left pointer forward until the duplicate
    character is removed from the window. This keeps the window valid with no repeating characters.

  Step 4: Moving the left Pointer (Shrinking the Window)
  Whenever a duplicate character is found at s[right], we move the left pointer to the right
  (i.e., we shrink the window).
  This continues until the duplicate character is removed from the window (i.e., removed from the set).
  Once the duplicate is removed, we resume expanding the window.

  Step 5: Updating the Maximum Length
  On each step, after adjusting the window, we calculate the length of the current substring
  (which is right - left + 1). If this length is larger than maxLength, we update maxLength.

  Step 6: Final Result
  At the end of the loop, maxLength will contain the length of the longest substring without repeating characters.
*/

int lengthOfLongestSubstring(String s) {
  // To store the maximum length of substring without repeating characters
  int maxLength = 0;
  // Left pointer for the sliding window
  int left = 0;
  // A set to store unique characters in the current window
  final unique = Set<String>();

  // Iterate through the string using the right pointer
  for (int right = 0; right < s.length; ++right) {
    // If the character at right is already in the set, move the left pointer
    while (unique.contains(s[right])) {
      // Remove character at left pointer from the set
      unique.remove(s[left]);
      // Move the left pointer to the right to shrink the window
      ++left;
    }
    // Add the character at the right pointer to the set
    unique.add(s[right]);
    // Update maxLength if the current window size is greater than maxLength
    maxLength = maxLength > unique.length ? maxLength : unique.length;
  }

  // Return the maximum length found
  return maxLength;
}
