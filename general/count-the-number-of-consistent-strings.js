// https://leetcode.com/problems/count-the-number-of-consistent-strings/

/* Question
    You are given a string allowed consisting of distinct characters and an array of strings words.
    A string is consistent if all characters in the string appear in the string allowed.

    Return the number of consistent strings in the array words.

    Example 1:
    Input: allowed = "ab", words = ["ad","bd","aaab","baa","badab"]
    Output: 2
    Explanation: Strings "aaab" and "baa" are consistent since they only contain characters 'a' and 'b'.

    Example 2:
    Input: allowed = "abc", words = ["a","b","c","ab","ac","bc","abc"]
    Output: 7
    Explanation: All strings are consistent.

    Example 3:
    Input: allowed = "cad", words = ["cc","acd","b","ba","bac","bad","ac","d"]
    Output: 4
    Explanation: Strings "cc", "acd", "ac", and "d" are consistent.
*/

var countConsistentStrings = function(allowed, words) {
    // Convert the allowed string into a Set for efficient lookups
    const allowedSet = new Set(allowed);
    
    // Initialize a counter for consistent strings
    let count = 0;
    
    // Iterate over each word in the words array
    for (const word of words) {
        // Check if every character in the word is in the allowed set
        if ([...word].every(char => allowedSet.has(char))) {
            count++;
        }
    }
    
    return count;
};

/* Optimization
  - Early exit from the inner loop: If a disallowed character is found, we immediately stop
    checking the rest of the word, saving time.
  - Time complexity improvement:
    Worst-case time complexity remains O(n * m), where n is the number of words and m is
    the averagelength of the words.
    However, in practice, the early exit will reduce the number of comparisons for inconsistent words,
    making it faster in many cases.
*/

function countConsistentStringsOptimized(allowed, words) {
    // Convert the allowed string into a Set for efficient lookups
    const allowedSet = new Set(allowed);
    
    // Initialize a counter for consistent strings
    let count = 0;
    
    // Iterate over each word in the words array
    for (const word of words) {
        let isConsistent = true;  // Assume the word is consistent initially
        
        // Check each character in the word
        for (const char of word) {
            // If a character is not in the allowed set, mark the word as inconsistent and break
            if (!allowedSet.has(char)) {
                isConsistent = false;
                break;
            }
        }
        
        // If the word is consistent, increment the count
        if (isConsistent) {
            count++;
        }
    }
    
    return count;
}
