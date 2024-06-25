#!/usr/bin/env perl
use v5.36;

use List::Util qw{ sum0 };

my @examples = (

    "aabb",
    "abab",
    "aaa",
    "bbb",
);

for my $example (@examples) {
    my $output = baftera($example);

    say <<"END";
Input:  \$str = "$example"
Output: $output
END
}

sub baftera ($str) {
    return 'false' unless $str =~ /b/mix;
    my $has_b = 0;
    for my $i ( 0 .. length $str ) {
        my $char = substr $str, $i, 1;
        $has_b = 1 if $char eq 'b';
        return 'false' if $has_b && $char eq 'a';
    }
    return 'true';
}
