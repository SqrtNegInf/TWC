#!/usr/bin/env perl
use v5.36;

use Test::More;
use Data::Dumper;

my $cases = [
	'abcdbca',
	'cdeabeabfcdfabgcd',
];

sub most_frequent_pair
{
    my $s = shift;

    my @s = split('', $s);
    my %h;
    for my $l (0..($#s-1)) {
        $h{$s[$l].$s[$l+1]}++;
    }
    return (sort {$h{$b} == $h{$a} ? 
					$a cmp $b :
                    $h{$b} <=> $h{$a}
				 } keys %h)[0];
}

is(most_frequent_pair($cases->[0]),  'bc', 'abcdbca');
is(most_frequent_pair($cases->[1]),  'ab', 'cdeabeabfcdfabgcd');
done_testing();

exit 0;

         
