const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    // Split the input string into words based on spaces and hyphens
    var word_list: std.ArrayList([]const u8) = .empty;
    defer word_list.deinit(allocator);

    var i: u8 = 0;
    var lastSplit: u8 = 0;
    for (words) |c| {
        if (c == ' ' or c == '-') {
            word_list.append(allocator, words[lastSplit..i]) catch return error.OutOfMemory;
            lastSplit = i + 1;
        }
        i += 1;
    }
    // Append the last word if there is one more
    if (lastSplit < i) {
        word_list.append(allocator, words[lastSplit..i]) catch return error.OutOfMemory;
    }

    var acronym: std.ArrayList(u8) = .empty;
    for (word_list.items) |word| {
        const onlyLetterWord = try onlyLetters(allocator, word);
        defer allocator.free(onlyLetterWord);
        if (onlyLetterWord.len > 0) {
            acronym.append(allocator, std.ascii.toUpper(onlyLetterWord[0])) catch return error.OutOfMemory;
        }
    }

    return acronym.toOwnedSlice(allocator);
}

fn onlyLetters(allocator: std.mem.Allocator, input: []const u8) ![]u8 {
    var list: std.ArrayList(u8) = .empty;
    errdefer list.deinit(allocator);

    for (input) |c| {
        if (std.ascii.isAlphabetic(c)) {
            try list.append(allocator, c);
        }
    }

    return list.toOwnedSlice(allocator);
}
