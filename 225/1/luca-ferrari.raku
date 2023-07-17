#!/usr/bin/env raku

#
# Perl Weekly Challenge 225
# Task 1
#
# See <https://perlweeklychallenge.org/blog/perl-weekly-challenge-225/>
#

#sub MAIN( *@sentences ) {
my @S = ["Perl and Raku belong to the same family.",
           "I love Perl.",
           "The Perl and Raku Conference."];
    my %data;
    %data{ $_ } = $_.split( /\s/ ).elems for @S;
    %data.values.max.say;
#}
