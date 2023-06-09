#!/usr/bin/env perl
use v5.36;

my $input = 28;
if ($input eq "") {
    print "empty input";
} else {
    my $res;
    if ($input =~ /\d+/) {
        $res = "A" x ($input / 26);
        $res .= chr($input % 26 - 1 + ord('A'));
    } else {
        for (split '', $input) {
            if ($_ eq 'A') { $res += 26; }
            else { $res += (ord($_) - ord('A') + 1); }
        }
    }
    print "Output: $res\n";
}
