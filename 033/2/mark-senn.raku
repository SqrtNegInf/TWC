#!/usr/bin/env raku

# Print first two lines.
# I just cut and pasted the lines from the problem
# description so it would be easy to see if the
# spacing was correct in the rest of the table.
print q:to/END/;
  x|   1   2   3   4   5   6   7   8   9  10  11
---+--------------------------------------------
END

# Print rest of table.
my $n = 11;
for (1..$n) -> $row
{
    "%3d|".printf($row);
    for (1..$n) -> $col
    {
        ($col < $row)
        ??  "    ".print
        !!  "%4d".printf($row*$col);
    }
    ''.say;
}
