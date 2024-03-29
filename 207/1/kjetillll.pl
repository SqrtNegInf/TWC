#!/usr/bin/env perl
use v5.36;

sub is_one_row_word { pop =~ /^( [qwertyuiop]+ | [asdfghjkl]+ | [zxcvbnm]+ )$/ix }

my @test = (
    ["Hello","Alaska","Dad","Peace"],
    ["OMG","Bye"]
);

for ( @ARGV ? ([@ARGV]) : @test ) {
    my @input = @$_;
    my @output = grep is_one_row_word($_), @input;
    say "Input: @input";
    say "Output: @output";
}

