#!/usr/bin/env perl
use v5.36;

my $in_str = shift // "Perl {Daily,Weekly,Monthly,Yearly} Challenge";
my ($start, $options, $end) = $in_str =~ /([^{]+) \{ ([^}]+) \} (.+)/x;
s/^ +| +$//g for ($start, $options, $end); # removing leading or trailing spaces
say "$start $_ $end" for split / *, */, $options;
