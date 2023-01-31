#!/usr/bin/env raku

my @arrs = [[0,1,3],[0,1], (0, 1, 3, 5, 9, 10) ];
for (@arrs) -> @arr {
    my $len = @arr.elems;
    print("Input: \@array = [",@arr,"]\n");
    my %hash = map {$_ => 1}, @arr;

    for (0..$len) -> $x {
        say "Output: $x\n" if ! %hash{$x};
    }
}
