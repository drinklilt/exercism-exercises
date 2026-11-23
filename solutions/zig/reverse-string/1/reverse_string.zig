/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    var left: usize = 0;
    var right: usize = s.len;
    while (left < right) {
        right -= 1;
        buffer[right] = s[left];
        buffer[left] = s[right];
        left += 1;
    }
    return buffer[0..s.len];
}
