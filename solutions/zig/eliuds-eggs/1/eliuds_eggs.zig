pub fn eggCount(number: usize) usize {
    // Need number (usize) in bits
    // Counts bits set to 1
    var count: usize = 0;
    var n = number;
    while (n != 0) : (n >>= 1) {
        count += n & 1;
    }
    return count;
}
