const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    const memory = try allocator.alloc(u8, dna.len);
    for (dna, 0..) |d, i| {
        switch (d) {
            'G' => {
                memory[i] = 'C';
            },
            'C' => {
                memory[i] = 'G';
            },
            'T' => {
                memory[i] = 'A';
            },
            'A' => {
                memory[i] = 'U';
            },
            else => {},
        }
    }
    return memory;
}
