#!/usr/bin/env raku

# 2023-02-16 GH5209

constant TARGET = 0;

my @list = @*ARGS.elems > 0 ?? @*ARGS.sort !! (-25, -10, -7, -3, 2, 4, 8, 10);
for @list.combinations(3) -> $combination {
    say $combination if (sum $combination) == TARGET;
   #say $combination if ([+] $combination) == TARGET;
}
