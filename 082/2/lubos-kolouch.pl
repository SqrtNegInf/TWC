#!/usr/bin/env perl
use v5.36;

sub InterLeave {

	my ($params) = @_;

	my $result = $params->{'result'} // {};
	my $a = $params->{'a'};
	my $b = $params->{'b'};
	my $current = $params->{'current'} // '';

	if (not $a and not $b) {
        $result->{$current} = 1;
        return $result;
    }

    $result = InterLeave({'a' => substr($a, 1), 'b' => $b, 'current' => $current.substr($a,0,1), 'result' => $result }) if length($a);
    $result = InterLeave({'b' => substr($b, 1), 'a' => $a, 'current' => $current.substr($b,0,1), 'result' => $result }) if length($b);

    return $result;
}

sub can_interleave {
    my ($params) = @_;

    return 0 unless length($params->{'a'}) + length($params->{'b'}) == length($params->{'c'});

    my $result = InterLeave($params);

    return defined $$result{$params->{'c'}}? 1: 0;
}

use Test::More;

is_deeply(can_interleave( { 'a' => 'XY', 'b' => 'X', c => 'XXY' } ), 1);
is_deeply(can_interleave( { 'a' => 'XXY', 'b' => 'XXZ', c => 'XXXXZY' } ), 1);
is_deeply(can_interleave( { 'a' => 'YX', 'b' => 'X', c => 'XXY' } ), 0);
is_deeply(can_interleave( { 'a' => 'XXY', 'b' => 'X', c => 'XXY' } ), 0);

done_testing;
