#!/usr/bin/env perl
use v5.36;
use Syntax::Construct qw{ // /r };

srand 1;

sub pangrams {
    my ($dictionary) = @_;
    my $pangram = "";
    open my $in, '<', $dictionary or die $!;
    chomp( my @words = <$in> );

    my $missing = join "", 'a' .. 'z';
    while ($missing) {
        my $word = @words[ rand @words ];

        # Only consider words that introduce a new char.
        if ($word =~ /[$missing]/) {
            $pangram .= "$word ";
            $missing =~ s/[$word]//g;
        }
    }
    return $pangram =~ s/ $//r
}

my $dictionary = shift // 'dictionary.txt';
say pangrams($dictionary);
