#!/usr/bin/env perl

use strict;
use warnings FATAL => qw(all);

use Algorithm::Combinatorics qw(variations_with_repetition);
use List::MoreUtils qw(zip);
use Scalar::Util qw(looks_like_number);

my @operators = ('+', '-', '');
my $string = "123456789";
my @array = split(//,$string);

my $iter = variations_with_repetition( [@operators], $#array);
my %uniq;

while ( my $c = $iter->next )
{
     my @z = zip(@array, @$c);
     pop @z; # undef.
     my $formula = join('',@z);
     $uniq{ $formula }++;
     next if $uniq{ $formula } > 1;

     my $sum = eval $formula;
     unless ( looks_like_number($sum))
     {
          print $@, $/;
          die "Sum is ${sum}: Something went wrong.";
     }

     next unless 100 == $sum;
     print "${formula} = ${sum}$/";
}
