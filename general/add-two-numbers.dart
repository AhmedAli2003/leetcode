// https://leetcode.com/problems/add-two-numbers/

/* Question - Medium
  You are given two non-empty linked lists representing two non-negative integers.
  The digits are stored in reverse order, and each of their nodes contains a single digit.
  Add the two numbers and return the sum as a linked list.

  You may assume the two numbers do not contain any leading zero, except the number 0 itself.

  Example 1:
  Input: l1 = [2,4,3], l2 = [5,6,4]
  Output: [7,0,8]
  Explanation: 342 + 465 = 807.

  Example 2:
  Input: l1 = [0], l2 = [0]
  Output: [0]

  Example 3:
  Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
  Output: [8,9,9,9,0,0,0,1]
*/

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  final dummy = ListNode(); // A dummy node to handle the result list
  ListNode? current = dummy; // Pointer to build the result list
  int carry = 0; // Variable to keep track of carry

  while (l1 != null || l2 != null || carry != 0) {
    // Get the current values of l1 and l2, or 0 if they are null
    final x = l1 != null ? l1.val : 0;
    final y = l2 != null ? l2.val : 0;

    // Calculate the sum of l1, l2, and carry
    int sum = x + y + carry;
    carry = sum ~/ 10; // Calculate the new carry
    sum %= 10; // Get the remainder to store in the current node

    // Add the result to the list
    current?.next = ListNode(sum);
    current = current?.next;

    // Move to the next nodes in l1 and l2 if they exist
    if (l1 != null) l1 = l1.next;
    if (l2 != null) l2 = l2.next;
  }

  return dummy.next; // Return the next node after the dummy (head of the result list)
}
