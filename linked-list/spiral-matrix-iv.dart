// https://leetcode.com/problems/spiral-matrix-iv/

/* Question - Medium
  You are given two integers m and n, which represent the dimensions of a matrix.

  You are also given the head of a linked list of integers.

  Generate an m x n matrix that contains the integers in the linked list presented
  in spiral order (clockwise), starting from the top-left of the matrix.
  If there are remaining empty spaces, fill them with -1.

  Return the generated matrix.

  Example 1:
  Input: m = 3, n = 5, head = [3,0,2,6,8,1,7,9,4,2,5,5,0]
  Output: [[3,0,2,6,8],[5,0,-1,-1,1],[5,2,4,9,7]]
  Explanation: The diagram above shows how the values are printed in the matrix.
  Note that the remaining spaces in the matrix are filled with -1.

  Example 2:
  Input: m = 1, n = 4, head = [0,1,2]
  Output: [[0,1,2,-1]]
  Explanation: The diagram above shows how the values are printed from left to right in the matrix.
  The last space in the matrix is set to -1.
*/

// ---------------------------------------------------------------------------------

/* Answer
  To solve the "Spiral Matrix IV" problem, the task is to generate an m x n matrix and
  fill it with values from a linked list in a spiral order.
  If the linked list is shorter than the total number of elements in the matrix,
  the remaining spaces should be filled with -1.

  Here's a step-by-step approach to solve the problem:

  Steps:
  - Matrix Initialization: Create an m x n matrix initialized with -1.
  - Traversal in Spiral Order: Start from the top-left corner and traverse the matrix in
    a spiral pattern (clockwise). Update the matrix with the values from the linked list as you traverse.
  Linked List Exhaustion: Once the linked list is fully traversed and there are no more values,
  continue filling the matrix with -1.

  Directions:
  - Move right until the end of the row.
  - Move down until the end of the column.
  - Move left until the start of the row.
  - Move up until you fill the matrix or run out of space.
  Edge Cases:
  - The linked list might be shorter than the matrix size.
  - Handle single-row and single-column matrices.
*/

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

List<List<int>> spiralMatrix(int m, int n, ListNode? head) {
  // Initialize matrix with -1
  List<List<int>> matrix = List.generate(m, (_) => List.filled(n, -1));

  // Spiral traversal bounds
  int top = 0, bottom = m - 1, left = 0, right = n - 1;
  ListNode? current = head;

  // Continue while we have valid bounds
  while (top <= bottom && left <= right) {
    // Traverse from left to right on the top row
    for (int i = left; i <= right; i++) {
      if (current != null) {
        matrix[top][i] = current.val;
        current = current.next;
      }
    }
    top++;

    // Traverse from top to bottom on the right column
    for (int i = top; i <= bottom; i++) {
      if (current != null) {
        matrix[i][right] = current.val;
        current = current.next;
      }
    }
    right--;

    // Traverse from right to left on the bottom row
    if (top <= bottom) {
      for (int i = right; i >= left; i--) {
        if (current != null) {
          matrix[bottom][i] = current.val;
          current = current.next;
        }
      }
      bottom--;
    }

    // Traverse from bottom to top on the left column
    if (left <= right) {
      for (int i = bottom; i >= top; i--) {
        if (current != null) {
          matrix[i][left] = current.val;
          current = current.next;
        }
      }
      left++;
    }
  }

  return matrix;
}
