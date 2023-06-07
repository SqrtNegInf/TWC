#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

sub X {
    my @a = @{ $_[0] };
    my @b = @{ $_[1] };

    return map {
        my $first = $_;
        map { 
            [ ref $first eq 'ARRAY' ? @{$first} : $first, $_ ];
        } @b;
    } @a;
}

my $S = 249;

my %digits = (
    1   => [ q{_}, q{,}, q{@} ],
    2   => [qw/ a b c /],
    3   => [qw/ d e f /],
    4   => [qw/ g h i /],
    5   => [qw/ j k l /],
    6   => [qw/ m n o /],
    7   => [qw/ p q r s /],
    8   => [qw/ t u v /],
    9   => [qw/ w x y z /],
    0   => [ q{} ],
    '*' => [ q{ } ],
    '#' => [ q{} ],
);

my @letters = map { $digits{$_} } split //, $S;
my @result = @{ $letters[0] };

for my $i (1 .. (scalar @letters) - 1 ) {
    @result = X(\@result, $letters[$i]);
}

say q{[}, (join q{, }, map { q{"} . (join q{}, @{$_}) . q{"} } @result), q{]};
