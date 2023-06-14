#!/usr/bin/env perl
use v5.36;

srand 1;

my $brackets = int rand(10) + 1;

my $str = '';
$str .= rand() < 0.5 ? '(' : ')' for ( 1 .. $brackets );

my $open_count = 0;
foreach my $b ( split //, $brackets ) {
    last if $open_count < 0;
    $b eq '(' ? $open_count++ : $open_count--;
}

print $str , ' - ', $open_count ? 'NOT OK' : 'OK';
