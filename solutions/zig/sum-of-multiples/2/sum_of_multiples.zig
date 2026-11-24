const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    // For each `factor`, find multiples of that number below `limit`
    // Add to a list, remove duplicates
    // Sum list

    var multiples: std.ArrayList(u32) = .empty;
    defer multiples.deinit(allocator);

    for (factors) |f| {
        if (f == 0) continue;
        const n_max: u32 = @divFloor(limit - 1, f);
        if (n_max == 0) continue;
        for (0..n_max) |_i| {
            const i = @as(u32, @intCast(_i)) + 1;
            try multiples.append(allocator, f * i);
        }
    }

    var seen = std.AutoHashMap(u32, void).init(allocator);
    var total: u64 = 0;
    defer seen.deinit();

    for (multiples.items) |m| {
        const entry = try seen.getOrPut(m);
        if (!entry.found_existing) {
            total += @as(u64, m);
        }
    }

    return total;
}
