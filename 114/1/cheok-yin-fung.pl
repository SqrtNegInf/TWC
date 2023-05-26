#!/usr/bin/env perl
use v5.36;

my $integer = $ARGV[0] || 123454320;
die "Please input a decimal positive integer.\n"
    unless $integer =~ /^[1-9][0-9]*$/;

print higher_pal($integer), "\n";



sub higher_pal {
    my $n = $_[0];
    if ($n == (10**length $n) - 1 ) {
        return (10**length $n)+1;
    }

    my $_prefixf = substr($n, 0, ((length $n) + 1)/2);
    my $p = pal_from_half( $_prefixf, (length $n) % 2 );
    if ($n >= $p) {
        return pal_from_half( $_prefixf+1, (length $n) % 2 );
    } 
    else {
        return $p;
    }
}

sub pal_from_half {
    my $s = $_[0];
    my $prefix = substr( $s  , 0 , (length $s) - $_[1] );
    my $mid = $_[1] ? substr($s, -1, 1) : "";
    my $new = join "", $prefix, $mid, reverse (split //, $prefix);
    return $new;
}

=pod TEST DATA:
my %data_ret = 
   (103 => 111,
    999 => 1001,
    9999 => 10001,
    123 => 131,
    121 => 131,
    1048576 => 1049401,
    1234 => 1331,
   );
...

test case parameter 103: passed 
test case parameter 123: passed 
test case parameter 1234: passed 
test case parameter 9999: passed 
test case parameter 121: passed 
test case parameter 999: passed 
test case parameter 1048576: passed 

done 7 test case(s); PASS: 7 case(s) .
=cut
