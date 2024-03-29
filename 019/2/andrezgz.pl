#!/usr/bin/env perl
use v5.36;

my $columns = $ARGV[0] || 40;
my $text = $ARGV[1] || example_text();

print wrap($text, $columns);

sub wrap {
    my ($content, $line_width) = @_;

    my $output = '';

    my $left = $line_width;
    foreach my $w (split / /,$content){
        my $l = length $w;
        if ($l + 1 > $left) {
            $output .= "\n";
            $left = $line_width;
        }
        $output .= "$w ";
        $left -= $l + 1;
    }

    return $output;
}

sub example_text {
    return 'A simple way to do word wrapping is to use a greedy algorithm that puts as many words on a line as possible,'
            .' then moving on to the next line to do the same until there are no more words left to place.'
            .' This method is used by many modern word processors, such as OpenOffice.org Writer and Microsoft Word.'
            .' This algorithm always uses the minimum possible number of lines but may lead to lines of widely varying lengths.';
}
