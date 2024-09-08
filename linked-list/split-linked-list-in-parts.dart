// https://leetcode.com/problems/split-linked-list-in-parts/

/* Question - Medium
  Given the head of a singly linked list and an integer k, split the linked list
  into k consecutive linked list parts.

  The length of each part should be as equal as possible: no two parts should
  have a size differing by more than one. This may lead to some parts being null.

  The parts should be in the order of occurrence in the input list,
  and parts occurring earlier should always have a size greater than or
  equal to parts occurring later.

  Return an array of the k parts.

  Example 1:
  Input: head = [1,2,3], k = 5
  Output: [[1],[2],[3],[],[]]
  Explanation:
  The first element output[0] has output[0].val = 1, output[0].next = null.

  The last element output[4] is null, but its string representation as a ListNode is [].
  Example 2:
  Input: head = [1,2,3,4,5,6,7,8,9,10], k = 3
  Output: [[1,2,3,4],[5,6,7],[8,9,10]]
  Explanation:
  The input has been split into consecutive parts with size difference at most 1,
  and earlier parts are a larger size than the later parts.
*/

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

List<ListNode?> splitListToParts(ListNode? head, int k) {
  // Step 1: Calculate the total length of the list
  int length = 0;
  ListNode? current = head;
  while (current != null) {
    ++length;
    current = current.next;
  }

  // Step 2: Calculate the size of each part
  int quotient = length ~/ k; // Minimum size of each part
  int remainder = length % k; // Extra nodes to distribute in the first `remainder` parts

  List<ListNode?> result = List.filled(k, null);
  current = head;

  for (int i = 0; i < k; ++i) {
    // Step 3: Determine the size of the current part
    int currentPartSize = quotient + (i < remainder ? 1 : 0);

    if (currentPartSize > 0) {
      result[i] = current;
      // Traverse the current part
      for (int j = 1; j < currentPartSize; j++) {
        current = current!.next;
      }

      // Detach the current part from the remaining list
      ListNode? nextPart = current!.next;
      current.next = null; // Break the link to the next part
      current = nextPart; // Move to the next part
    }
  }

  return result;
}
