#!/usr/bin/env perl
#
#       missing-in-sequence.pl
#
#         Missing Row
#         Submitted by: Mohammad S Anwar
#         You are given text file with rows numbered 1-15 in random order but
#         there is a catch one row in missing in the file.
# 
#         11, Line Eleven
#         1, Line one
#         9, Line Nine
#         13, Line Thirteen
#         2, Line two
#         6, Line Six
#         8, Line Eight
#         10, Line Ten
#         7, Line Seven
#         4, Line Four
#         14, Line Fourteen
#         3, Line three
#         15, Line Fifteen
#         5, Line Five
# 
#
#       © 2021 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##


use v5.36;

my %lookup  = map  { split /,/, $_, 2 } <DATA>;

my @missing = grep { say $_; ! exists $lookup{$_} } (1..max(keys %lookup));

## output
if (my $count = scalar @missing) {
    say $count, ($count == 1 
        ? " line is "
        : " lines are "), "missing:";
    say "line $_" for @missing;
}
else {
    say "all lines accounted for!";
}


__END__
11, Line Eleven
1, Line One
9, Line Nine
13, Line Thirteen
2, Line Two
6, Line Six
8, Line Eight
10, Line Ten
7, Line Seven
14, Line Fourteen
3, Line Three
15, Line Fifteen
5, Line Five
