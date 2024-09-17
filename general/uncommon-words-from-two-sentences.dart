// https://leetcode.com/problems/uncommon-words-from-two-sentences/

/* Question
A sentence is a string of single-space separated words where each
word consists only of lowercase letters.

A word is uncommon if it appears exactly once in one of the sentences,
and does not appear in the other sentence.

Given two sentences s1 and s2, return a list of all the uncommon words.
You may return the answer in any order.

Example 1:
Input: s1 = "this apple is sweet", s2 = "this apple is sour"
Output: ["sweet","sour"]
Explanation:
The word "sweet" appears only in s1, while the word "sour" appears only in s2.

Example 2:
Input: s1 = "apple apple", s2 = "banana"
Output: ["banana"]
*/

List<String> uncommonFromSentences(String s1, String s2) {
  // To store every word and its occurrence count
  final map = <String, int>{};

  for (final word in s1.split(' ')) {
    if (map[word] == null) {
      map[word] = 1;
    } else {
      map[word] = map[word]! + 1;
    }
  }

  for (final word in s2.split(' ')) {
    if (map[word] == null) {
      map[word] = 1;
    } else {
      map[word] = map[word]! + 1;
    }
  }

  // return where the number of occurrence equals one
  return map.keys.where((k) => map[k] == 1).toList();
}

// Same concise solution
List<String> uncommonFromSentencesConcise(String s1, String s2) {
  final map = <String, int>{};

  // Combine both sentences and process them in one loop
  for (final word in (s1 + ' ' + s2).split(' ')) {
    map.update(word, (value) => value + 1, ifAbsent: () => 1);
  }

  return map.keys.where((k) => map[k] == 1).toList();
}
