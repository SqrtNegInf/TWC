#!/usr/bin/env perl
use v5.36;

use Carp;
use Getopt::Long;

my $f = $0; # this program
my $a = 3;  
my $b = 6;
GetOptions(
    'f=s' => \$f,
    'a=i' => \$a,
    'b=i' => \$b,
);

show_lines( $a, $b, $f );

sub show_lines ( $a, $b, $f ) {
    my $c = 0;
    if ( open my $fh, '<', $f ) {
        my @array = <$fh>;
        for my $i (@array) {
            $c++;
            next if $c > $b;
            next if $c < $a;
            print $i ;
        }
    }
}
