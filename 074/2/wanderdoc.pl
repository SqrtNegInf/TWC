#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Test::More;

sub fnr
{
     my $string = $_[0];
     my @letters = split(//,$string);
     my $output;

     for my $i ( 0 .. $#letters )
     {
          my @pass = @letters[0 .. $i];
          my %count;
          $count{$_}++ for @pass; 


          my $fnr = (grep {1 == $count{$_}} @pass)[-1] || '#';
          $output .= $fnr
     }

     return $output;
}

is(fnr('ababc'),  'abb#c',  'Example 1');
is(fnr('xyzzyx'), 'xyzyx#', 'Example 2');
done_testing();
