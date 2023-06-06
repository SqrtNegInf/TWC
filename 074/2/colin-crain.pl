#!/usr/bin/env perl
use v5.36;

my $str = shift @ARGV // 'ababcabd';
my %uniq;
my $fnr = undef;
my @prev;
my $output;

while (my $char = substr $str, 0, 1, '') {
    $uniq{$char}++;
    
    if ($uniq{$char} == 1) {
        push @prev, $fnr unless not defined $fnr;
        $fnr = $char;
    }    
    elsif ($uniq{$fnr} == 2) {
        @prev = grep { $uniq{$_} == 1 } @prev;
        $fnr = @prev ? pop @prev : undef;
    }
    $output .= $fnr // '#';
}

say $output;
