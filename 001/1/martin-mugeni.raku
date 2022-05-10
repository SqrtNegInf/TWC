#!/usr/bin/env raku

my $string_1 = "Perl Weekly Challenge";

my Int $e_count = $string_1.comb('e').conj;
my $string_2 = $string_1.=trans('e'=>'E');
say $string_2 ~ " " ~ "and" ~ " "~ "count of e is" ~" "~ $e_count;
