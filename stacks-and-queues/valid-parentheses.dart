// https://leetcode.com/problems/valid-parentheses/

/* Question
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']',
determine if the input string is valid.

An input string is valid if:

- Open brackets must be closed by the same type of brackets.
- Open brackets must be closed in the correct order.
- Every close bracket has a corresponding open bracket of the same type.

Example 1:
Input: s = "()"
Output: true

Example 2:
Input: s = "()[]{}"
Output: true

Example 3:
Input: s = "(]"
Output: false

Example 4:
Input: s = "([])"
Output: true
*/

// Classic Question on Stack Data Structure
bool isValid(String s) {
  // Map of open brackets to their corresponding close brackets
  const brackets = {
    '(': ')',
    '[': ']',
    '{': '}',
  };

  final stack = Stack();

  for (int i = 0; i < s.length; ++i) {
    final char = s[i];

    // If it's an opening bracket, push it to the stack
    if (brackets.containsKey(char)) {
      stack.push(char);
    } else {
      // If the stack is empty or the top of the stack doesn't match the current closing bracket
      if (stack.isEmpty || brackets[stack.pop()] != char) {
        return false;
      }
    }
  }

  // If the stack is empty, all open brackets have been closed
  return stack.isEmpty;
}

class Stack {
  List<String> get elemenets => _elements;

  final List<String> _elements = [];

  int get length => _elements.length;

  bool get isEmpty => _elements.isEmpty;

  void push(String e) {
    _elements.add(e);
  }

  String? pop() {
    if (_elements.isEmpty) {
      return null;
    }
    return _elements.removeLast();
  }

  String? peek() {
    if (_elements.isEmpty) {
      return null;
    }
    return _elements.last;
  }
}
