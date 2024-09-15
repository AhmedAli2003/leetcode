// https://leetcode.com/problems/find-the-longest-substring-containing-vowels-in-even-counts/

/* Question - Medium
  Given the string s, return the size of the longest substring containing each vowel an even number of times.
  That is, 'a', 'e', 'i', 'o', and 'u' must appear an even number of times.

  Example 1:
  Input: s = "eleetminicoworoep"
  Output: 13
  Explanation: The longest substring is "leetminicowor" which contains two each of the
  vowels: e,i and o and zero of the vowels: a and u.

  Example 2:
  Input: s = "leetcodeisgreat"
  Output: 5
  Explanation: The longest substring is "leetc" which contains two e's.

  Example 3:
  Input: s = "bcbcbc"
  Output: 6
  Explanation: In this case, the given string "bcbcbc" is the longest because
  all vowels: a, e, i, o and u appear zero times.
*/

/* Explaination
  State Representation Using a Bitmask:
  We use an integer (state) to represent the parity (even/odd count) of the vowels a, e, i, o, u.

  The integer has 5 bits, where each bit represents one vowel:
  - 1st bit: represents whether 'a' has been seen an odd number of times.
  - 2nd bit: represents whether 'e' has been seen an odd number of times.
  - 3rd bit: represents whether 'i' has been seen an odd number of times.
  - 4th bit: represents whether 'o' has been seen an odd number of times.
  - 5th bit: represents whether 'u' has been seen an odd number of times.

  Example:
  If state == 3 (binary 00011), this means:
  'a' has been seen an odd number of times (1st bit = 1).
  'e' has been seen an odd number of times (2nd bit = 1).
  All other vowels ('i', 'o', 'u') have been seen an even number of times.

  Updating the State:
  For each vowel encountered in the string, we toggle its corresponding bit in the state.
  The XOR operation state ^= 1 << x toggles the bit in the x-th position.
  Example:

  If the current character is 'a' and the state is 00000
  (no vowels seen an odd number of times), then:
  state ^= 1 << 0 will set the 1st bit to 1 (now state is 00001).
  If 'a' appears again, toggling the 1st bit will reset it back
  to 0 (since two 'a's have been seen, which is even).

  Using a Map to Track State:
  The map stateToIndex stores the first occurrence of each unique state.
  If we encounter the same state at two different indices,it means the substring between these
  indices contains all vowels an even number of times
  (since the state didn’t change between these two points).

  Example:
  If the same state is seen at index 2 and index 10, then the substring between
  indices 3 and 10 contains all vowels an even number of times.

  Finding the Longest Substring:
  As we iterate through the string, we check if the current state has been seen before.
  If so, we calculate the length of the substring between the
  first occurrence of the state and the current index.
  We keep track of the maximum length of such substrings.

  Initial Map Setup:
  We initialize the map with {0: -1}.
  This handles the case where the entire substring from the start of the string is valid.
  A state of 0 means that all vowels have been seen an even number of times,
  so an empty substring (at index -1) is valid.

  Example Walkthrough:
  For the input string "eleetminicoworoep":
  We iterate through the string and update the state as we encounter vowels.
  At various points, the state becomes equal to values seen earlier,
  indicating that the substring between these two points contains each vowel an even number of times.
  The longest such substring is "leetminicowor" with a length of 13.
  This code ensures that we can efficiently find the longest substring in linear time O(n),
  where n is the length of the string.
*/

int findTheLongestSubstring(String s) {
  // Get the length of the input string
  final n = s.length;

  // Map to store the first occurrence of a given "state"
  // The state represents the parity (even/odd) of vowels using a 5-bit integer.
  // The key is the state, and the value is the index where that state first appeared.
  final stateToIndex = <int, int>{0: -1}; // Initialize with state 0 at index -1 (empty string state)

  // 'state' will keep track of the parity of vowels using a 5-bit integer.
  // Each bit represents one of the vowels 'a', 'e', 'i', 'o', 'u'.
  // A bit is 1 if the corresponding vowel has been seen an odd number of times.
  int state = 0;

  // Variable to store the maximum length of the valid substring
  int maxLength = 0;

  // Iterate through the string character by character
  for (int i = 0; i < n; ++i) {
    // Check if the current character is a vowel and update the state accordingly
    switch (s[i]) {
      case 'a':
        state ^= 1 << 0; // Toggle the 1st bit (for 'a')
        break;
      case 'e':
        state ^= 1 << 1; // Toggle the 2nd bit (for 'e')
        break;
      case 'i':
        state ^= 1 << 2; // Toggle the 3rd bit (for 'i')
        break;
      case 'o':
        state ^= 1 << 3; // Toggle the 4th bit (for 'o')
        break;
      case 'u':
        state ^= 1 << 4; // Toggle the 5th bit (for 'u')
        break;
    }

    // If this state has been seen before, it means the substring between
    // the previous occurrence of this state and the current index contains
    // all vowels an even number of times.
    if (stateToIndex.containsKey(state)) {
      // Calculate the length of the substring
      final currentLength = i - stateToIndex[state]!;
      // Update the maxLength if the current length is greater
      maxLength = maxLength > currentLength ? maxLength : currentLength;
    } else {
      // If the state has not been seen before, store the current index
      stateToIndex[state] = i;
    }
  }

  // Return the length of the longest valid substring found
  return maxLength;
}
