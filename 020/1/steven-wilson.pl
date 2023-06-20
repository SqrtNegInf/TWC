#!/usr/bin/env perl
use v5.36;

use Test::More;

my $test_string = "ABBCDEEF";
my @test_result = split_string_on_character_change($test_string);

ok( scalar @test_result == 6, "test size of array" );
ok( $test_result[0] eq "A",   "first element is \"A\"" );
ok( $test_result[4] eq "EE",  "fifth element is \"EE\"" );

done_testing();

my $input_string = 'bookkeeper';

sub split_string_on_character_change {
    my $string = shift;
    my @splits = do {
        my $i;
        grep { ++$i % 2 } $string =~ m/((.)\g{-1}*)/g;
    };
    return @splits;
}

my @strings = split_string_on_character_change($input_string);

for (@strings) {
    say $_;
}
