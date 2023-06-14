#!/usr/bin/env perl
use v5.36;

use constant { BLUE => 8, YELLOW => 7, GREEN => 5, RED => 9, SUM => 11};
use List::Util qw(reduce all);
use Algorithm::Combinatorics qw(permutations);


my %var;
my @col2search = qw(red_green green_black black black_yellow yellow_blue);
@var{@col2search} = (undef) x 5;
my @red     = (RED,                \$var{red_green});
my @green   = (GREEN,              \$var{red_green},     \$var{green_black});
my @black   = (\$var{green_black}, \$var{black},         \$var{black_yellow});
my @yellow  = (YELLOW,             \$var{black_yellow},  \$var{yellow_blue});
my @blue    = (BLUE, \$var{yellow_blue});

my @olympic = ( \@red, \@green, \@black, \@yellow, \@blue );

my @numbers = (1, 2, 3, 4, 6);


my $iter = permutations(\@numbers);

while (my $i = $iter->next())
{
     @var{@col2search} = @$i;

     next unless ( all { is_valid($_) } @olympic );
     print join(' => ', $_, $var{$_}), $/ for @col2search; 
}



sub ring_sum
{
     my @ring = @{$_[0]};

     my $sum = reduce { ('SCALAR' eq ref $a ? $$a : $a) + ('SCALAR' eq ref $b ? $$b : $b) } @ring;
     return $sum;
}


sub is_valid
{
     return SUM == ring_sum($_[0]);
}

