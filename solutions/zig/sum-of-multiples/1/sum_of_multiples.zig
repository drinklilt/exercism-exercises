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

    var unique: std.ArrayList(u32) = .empty;
    defer unique.deinit(allocator);

    for (multiples.items) |m| {
        var found: bool = false;
        for (unique.items) |u| {
            if (u == m) {
                found = true;
                break;
            }
        }
        if (!found) {
            try unique.append(allocator, m);
        }
    }

    var total: u64 = 0;
    for (unique.items) |u| {
        total += u;
    }

    return total;
}
