#!/usr/bin/env perl
use v5.36;

sub combine_digits ($numeric_string) {
    my @combinations;
    for my $n (1 .. length $numeric_string) {
        my $number = substr $numeric_string, 0, $n;
        my $rest   = substr $numeric_string, $n;
        if ($rest eq q{}) {
            push @combinations, [$number];
        }
        else {
            for my $numbers (@{combine_digits($rest)}) {
                unshift @{$numbers}, $number;
                push @combinations, $numbers;
            }
        }
    }
    return \@combinations;
}

sub is_additive (@numbers) {
    my $size = @numbers;
    return 0 if $size < 3;
    for my $i (0 .. $size - 3) {
        return 0 if $numbers[$i] + $numbers[$i + 1] != $numbers[$i + 2];
    }
    return 1;
}

sub myany : prototype(&@) {
    my ($code, @list) = @_;

    for my $element (@list) {
        return 1 if $code->(local $_ = $element);
    }
    return 0;
}

sub is_additive_number ($numeric_string) {
    return myany { is_additive(@{$_}) } @{combine_digits($numeric_string)};
}

say is_additive_number('112358');
say is_additive_number('12345');
say is_additive_number('199100199');
