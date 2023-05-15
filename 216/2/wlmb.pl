#!/usr/bin/env perl

use v5.36;
use List::Util qw(min);
my ($word, @stickers)= ('peon', 'perl','raku','python');
# Map letters to stickers
my %stickers_with_letter;
for my $s(@stickers){
    push @{$stickers_with_letter{$_}}, $s for split "", lc $s;
}
my $result=0+solve({}, [split "", lc $word]);
say "Word: $word, stickers: @stickers, result: $result";

sub solve($available, $letters){
    my @letters=@$letters;
    my %available=%$available;
    my @remaining=grep {my $a=$available{$_}; $available{$_}-- if $a; !$a} @letters;
    return 0 unless @remaining;
    my $first=$remaining[0];
    my @possible_results;
    for(@{$stickers_with_letter{$first}}){
	my %augmented=%available;
	$augmented{$_}++ for split "", lc $_;
	push @possible_results, solve(\%augmented, \@remaining);
    }
    my $min=min  grep {defined} @possible_results;
    return 1+$min if defined $min;
    return undef;
}
