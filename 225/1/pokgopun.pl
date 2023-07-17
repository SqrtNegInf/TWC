#!/usr/bin/env perl
use v5.36;

my @list = @ARGV ? @ARGV :

("Perl and Raku belong to the same family.",
"I love Perl.",
"The Perl and Raku Conference."
);
#("The Weekly Challenge.",
#"Python is the most popular guest language.",
#"Team PWC has over 300 members."
#);

my @sort = sort map{ scalar(split /\s/, $_) } @list;
## use Data::Dumper;
## print Dumper \@sort;
## exit(0);

printf(
	"Input: \@list = (%s)\nOutput: %d\n",
	join( ",\n"." "x16, map{ '"'.$_.'"' } @list ),
	$sort[-1]
);

