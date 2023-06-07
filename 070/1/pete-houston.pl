#!/usr/bin/env perl
use v5.36;

my ($str, $count, $offset) = ('perlandraku', 3, 4);
print chswap($str, $count, $offset) . "\n";

sub chswap {
    my ($str, $count, $offset) = @_;
    my $wrap = $count + $offset == length $str; # Special case
    $str .= substr ($str, 0, 1) if $wrap;
    substr ($str, $offset, $count,
        substr ($str, 1, $count,
        substr ($str, ++$offset, $count)));
    $str =~ s/^.(.*)(.)$/$2$1/ if $wrap;
    return $str;
}
