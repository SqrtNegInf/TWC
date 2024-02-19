#!/usr/bin/env perl

use strict;
use warnings;

use List::Util qw(min);

my $str1 = "abcd";
my $str2 = "1234";
merge_strings($str1, $str2);

$str1 = "abc";
$str2 = "12345";
merge_strings($str1, $str2);

$str1 = "abcde";
$str2 = "123";
merge_strings($str1, $str2);

exit 0;

sub merge_strings {
    my $str1 = shift || '';
    my $str2 = shift || '';

    my $s = '';
    my $length = min(length($str1), length($str2) );
    foreach my $i (0..$length) {
        $s .= substr $str1, $i, 1;
        $s .= substr $str2, $i, 1;
    }
    if (length($str1) > $length) {
        $s .= substr $str1, $length+1;
    } elsif (length($str2) > $length) {
        $s .= substr $str2, $length+1;
    }
    printf "%s | %s -> %s\n", $str1, $str2, $s;

    return undef;
}
