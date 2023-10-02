#!/usr/bin/env perl
use strict;
use warnings;

sub exact_change {
    my ($notes) = @_;
    my %wallet = ( 5 => 0, 10 => 0, 20 => 0 );

    foreach my $bill (@$notes) {
        die "Bad bill '$bill'" unless exists $wallet{$bill};
        if ( $bill == 20 ) {
            if ($wallet{10} and $wallet{5}) {
                $wallet{10}--;
                $wallet{5}--;
            }
            elsif ($wallet{5} >= 3) {
                $wallet{5} -= 3;
            }
            else {
                return 0;
            }
        }
        elsif ( $bill == 10 ) {
            $wallet{5}--
                or return 0;
        }
        $wallet{$bill}++;
    }
    return 1;
}

use Test::More;
foreach my $tuple (
    [1,[5,5,5,10,20]],
    [0,[5,5,10,10,20]],
    [1,[5,5,5,20]],
    [1,[5,5,5,5,10,20,10]],
) {
    my ($want, $notes)= @$tuple;
    my $got = exact_change($notes);
    is($got, $want, "exact_change(@$notes) == $want");
}
done_testing();
