#!/usr/bin/env perl
use v5.36;

use Syntax::Construct qw{ // };

my $file = shift // '/usr/share/dict/words';
my %max = (0 => [""]);
open my $in, '<', $file or die $!;
WORD:
while (my $word = <$in>) {
    chomp $word;
    my $l = lc $word;
    for my $i (2 .. length $word) {
        next WORD if substr($l, $i - 2, 1) gt substr($l, $i - 1, 1);
    }
    if (length($word) > (keys %max)[0]) {
        %max = (length $word => [$word]);
    } elsif (length($word) == (keys %max)[0]) {
        push @{ $max{ length $word } }, $word;
    }
}
say for map @$_, values %max;

__END__
beefily
billowy
chikors
dikkops
Elmmott
