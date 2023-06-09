#!/usr/bin/env perl
use v5.36;

sub partition {
    my $k = shift;
    my @before = grep {$_ < $k} @_;
    my @after = grep {$_ >= $k} @_;
    return @before, @after;
}

my $k = 3;
my $list_str = shift // "1 4 3 2 5 2";
my @list = $list_str =~ /\d+/g;
my @result = partition $k, @list;
say join " → ", @result;
