#!/usr/bin/env perl
use v5.36;

use Memoize;

my $n = 19;

$n >= 0 or die "N must be non-negative\n";

memoize('F');
sub F {
    my ($n) = @_;
    if ($n == 0) {
        return 1;
    } else {
        return $n - M(F($n-1));
    }
}

memoize('M');
sub M {
    my ($n) = @_;
    if ($n == 0) {
        return 0;
    } else {
        return $n - F(M($n-1));
    }
}

print 'F:';
foreach my $i (0 .. $n) {
    print ' ', F($i);
}
print "\n";

print 'M:';
foreach my $i (0 .. $n) {
    print ' ', M($i);
}
print "\n";
