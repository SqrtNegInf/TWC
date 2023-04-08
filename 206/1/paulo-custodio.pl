#!/usr/bin/env perl
use v5.36.0;
use Modern::Perl;

@ARGV = ("10:10", "09:30", "09:00", "09:55");

my @in = sort { $a <=> $b } map { minutes($_) } @ARGV;
push @in, $in[0] + minutes("24:00");
my $min = $in[-1] - $in[0];
for my $i (0..$#in-1) {
    my $n = $in[$i+1] - $in[$i];
    $min = $n if $n < $min;
}
say $min;

sub minutes {
    my($t) = @_;
    $t =~ /^(\d+):(\d+)$/ or die "invalid time $t\n";
    return $1*60+$2;
}
