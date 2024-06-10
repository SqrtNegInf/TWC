#!/usr/bin/env perl

use v5.36;

my @test_inputs = ["1.1.1.1"];

if (scalar @ARGV == 0) {
    @test_inputs = (
	"1.1.1.1",
	"255.101.1.0"
	);
}
	
for (@test_inputs) {
    printf;
    say " => " . defang($_);
}

sub defang {
    shift;
    s/\./[.]/g;
    return $_;
}
