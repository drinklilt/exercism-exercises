pub const TriangleError = error{Invalid};

pub const Triangle = struct {
    a: f64,
    b: f64,
    c: f64,

    pub fn init(a: f64, b: f64, c: f64) TriangleError!Triangle {
        // If sides are zero, the triangle is invalid.
        if (a == 0 or b == 0 or c == 0) {
            return TriangleError.Invalid;
        }
        // If the sum of any two sides is less than or equal to the third, the triangle is invalid.
        if (a + b <= c or a + c <= b or b + c <= a) {
            return TriangleError.Invalid;
        }
        return Triangle{ .a = a, .b = b, .c = c };
    }

    pub fn isEquilateral(self: Triangle) bool {
        return self.a == self.b and self.b == self.c;
    }

    pub fn isIsosceles(self: Triangle) bool {
        return self.a == self.b or self.b == self.c or self.a == self.c;
    }

    pub fn isScalene(self: Triangle) bool {
        return self.a != self.b and self.b != self.c and self.a != self.c;
    }
};
