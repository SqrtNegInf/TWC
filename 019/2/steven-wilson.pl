#!/usr/bin/env perl
use v5.36;

my $text = "I saw the best minds of my generation destroyed by madness,
starving hysterical naked, dragging themselves through the negro streets
at dawn looking for an angry fix, Angel-headed hipsters burning for the
ancient heavenly connection to the starry dynamo in the machinery of
night,";

$text =~ s/\R/ /g;

my $line_width = 40;

my @words = split / /, $text;

my $space_left = $line_width;

for my $word (@words) {
    if ( ( ( length $word ) + 1 ) > $space_left ) {
        print "\n$word ";
        $space_left = $line_width - length $word;
    }
    else {
        print "$word ";
        $space_left -= ( ( length $word ) + 1 );
    }
}
print "\n";
