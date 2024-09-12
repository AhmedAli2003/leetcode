double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  if (nums1.length > nums2.length) {
    // Ensure nums1 is the smaller array
    return findMedianSortedArrays(nums2, nums1);
  }

  int m = nums1.length;
  int n = nums2.length;
  int low = 0;
  int high = m;

  while (low <= high) {
    int partitionX = (low + high) ~/ 2;
    int partitionY = (m + n + 1) ~/ 2 - partitionX;

    // If partitionX is 0, it means nothing is on the left side for nums1
    // If partitionX is m, it means nothing is on the right side for nums1
    int maxX = (partitionX == 0) ? double.negativeInfinity.toInt() : nums1[partitionX - 1];
    int minX = (partitionX == m) ? double.infinity.toInt() : nums1[partitionX];

    // Same logic for nums2
    int maxY = (partitionY == 0) ? double.negativeInfinity.toInt() : nums2[partitionY - 1];
    int minY = (partitionY == n) ? double.infinity.toInt() : nums2[partitionY];

    // Check if we have found the correct partition
    if (maxX <= minY && maxY <= minX) {
      // If total number of elements is even
      if ((m + n) % 2 == 0) {
        return ((maxX + maxY) / 2.0).toDouble();
      } else {
        // If total number of elements is odd
        return maxX > maxY ? maxX.toDouble() : maxY.toDouble();
      }
    } else if (maxX > minY) {
      // We are too far on the right side for partitionX. Go left.
      high = partitionX - 1;
    } else {
      // We are too far on the left side for partitionX. Go right.
      low = partitionX + 1;
    }
  }

  return 0;
}
