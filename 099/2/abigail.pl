#!/usr/bin/env perl
use v5.36;

#
# Read input from standard input, assuming one exercise per line.
# Each line consists of a string $S, and a pattern $T, separated
# by whitespace.
#

#
# Take the pattern, and turn in into a Perl regular expression which
# matches against the string (by quotemetaing each character, and
# separating the characters with '.*'). Then apply the regular expression
# agains the string, following it with a (?{ }) which counts the matches,
# and then a "(*FAIL)" to force backtracking.
#

while (<DATA>) {
    my ($str, $pat) = split ' ', $_;
    my $count = 0;
    $pat = join ".*" => map {quotemeta $_} split // => $pat;
    $str =~ /$pat(?{$count ++})(*FAIL)/;
    say $count;
}

__END__
littleit lit
london lon
