#!/usr/bin/env raku

use Test;

my @Test =
    8,    ["Perl and Raku belong to the same family.",
           "I love Perl.",
           "The Perl and Raku Conference."],
    7,    ["The Weekly Challenge.",
           "Python is the most popular guest language.",
           "Team PWC has over 300 members."],
    8,    ["Manwar gets the White Camel in 2023.",
           "The committee, or whoever decided, chose well.",
           "Congratulations to Manwar for the well deserved recognition.",
           "He has my thanks for his service."],
;
plan @Test/2;

my $word-pattern = /\S+/;   # NOTE: Definition of 'word' is loose.

sub word-ct( $a = 'word w.'-->Int) { 
    ( $a ~~ m/:s ^ (<$word-pattern> \s*)+ $/ ).list[0].elems;
}

sub func( @sentence --> Int) { [max=] @ = @sentence».&word-ct; }

my $i= 0;
for @Test -> $exp, @in {
    is func(@in), $exp, "$exp <-- \@Test[" ~ ++$i ~ ']';
    $i++;
}
done-testing;

my $list = @Test[*-1];
print "\nInput: @list = (\"";
print $list.join( "\"\n                \",");
say '")';
say "Output: &func( $list)";

