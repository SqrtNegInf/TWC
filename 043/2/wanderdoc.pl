#!/usr/bin/env perl
use v5.36;

my %digits; @digits{0 .. 63} = ('0'..'9', 'A'..'Z', 'a' .. 'z', '-', '_');

sub descr_create
{
     my $base = $_[0];
     if ( $base <= 3 or $base == 6 ) { return "Does not exist!" }
     if ( $base == 4 ) { return "1210 or 2020"; }
     if ( $base == 5 ) { return "21200"; }
     if ( $base > 64 ) { return "Is not implemented!"; }

     my @number = (0) x $base;

     $number[0] = $base - 4;
     $number[1] = 2;
     $number[2] = 1;
     $number[$#number - 3] = 1;
     my $num_str = join('', map $digits{$_}, @number);
     return $num_str;
}

for my $base ( 1 .. 64 )
{
     my $descr_num = descr_create($base);
     print join("\t", $base, $descr_num), $/; 
}


