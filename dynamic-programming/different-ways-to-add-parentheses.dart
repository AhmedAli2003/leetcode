// https://leetcode.com/problems/different-ways-to-add-parentheses/

/* Question - Medium
  Given a string expression of numbers and operators, return all possible results from
  computing all the different possible ways to group numbers and operators.
  You may return the answer in any order.

  The test cases are generated such that the output values fit in a 32-bit integer
  and the numberof different results does not exceed 104. 

  Example 1:
  Input: expression = "2-1-1"
  Output: [0,2]
  Explanation:
  ((2-1)-1) = 0 
  (2-(1-1)) = 2

  Example 2:
  Input: expression = "2*3-4*5"
  Output: [-34,-14,-10,-10,10]
  Explanation:
  (2*(3-(4*5))) = -34 
  ((2*3)-(4*5)) = -14 
  ((2*(3-4))*5) = -10 
  (2*((3-4)*5)) = -10 
  (((2*3)-4)*5) = 10
*/

// Helper function to compute all possible results for a given expression
List<int> compute(String expr, Map<String, List<int>> memo) {
  // If the result for the current expression is already computed, return it
  if (memo.containsKey(expr)) {
    return memo[expr]!;
  }

  final results = <int>[];
  // Traverse the string to split it at each operator
  for (int i = 0; i < expr.length; ++i) {
    final char = expr[i];

    // If the character is an operator
    if (char == '+' || char == '-' || char == '*') {
      // Compute the left and right sub-expressions recursively
      final left = compute(expr.substring(0, i), memo);
      final right = compute(expr.substring(i + 1), memo);

      // Compute all combinations of results from left and right sub-expressions
      for (final l in left) {
        for (final r in right) {
          int res = 0;
          if (char == '+') {
            res = l + r;
          } else if (char == '-') {
            res = l - r;
          } else if (char == '*') {
            res = l * r;
          }
          results.add(res);
        }
      }
    }
  }

  // If no operators are found, the expression is just a number, so parse it
  if (results.isEmpty) {
    results.add(int.parse(expr));
  }

  // Store the result in the memoization map and return it
  memo[expr] = results;
  return results;
}

List<int> diffWaysToCompute(String expression) {
  // Memoization map to store already computed results
  final memo = <String, List<int>>{};

  // Call the helper function on the entire expression
  return compute(expression, memo);
}
