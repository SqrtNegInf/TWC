#!/usr/bin/env perl
use v5.36;

sub perm
{
    state $n = 0;
	my ($k, $perm, @set) = @_;
	unless (@set) {
        ++$n;
        printf "%2d %s\n", $n, $perm if $k == $n;
        return $k == $n;
    }
	foreach (0..$#set) {
        return 1 if perm($k, $perm.$set[$_], @set[0..$_-1], @set[$_+1..$#set]);
    }
}

my @inp = 1..3;
my $k = 4;
perm($k, '', @inp);
exit 0;
