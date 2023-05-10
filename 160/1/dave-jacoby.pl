#!/usr/bin/env perl
use v5.36;
no warnings qw{ experimental };

use Carp;
use Getopt::Long;
use Lingua::EN::Numbers qw(num2en);

my $n = 5;
GetOptions( 'number=i' => \$n, );
croak 'Out of range' if $n < 1;

say magic($n);

sub magic ( $i ) {
    return 'four is magic.' if $i == 4;
    my $w   = num2en($i);
    my $c   = () = $w =~ /(\w)/gmix;
    my $d   = num2en($c);
    my $out = qq{$w is $d, };
    $out .= magic($c);
    return ucfirst lc $out;
}

