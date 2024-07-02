#!/usr/bin/env perl
use v5.36;

my @examples = ('a1c1e1', 'a1b2c3d4', 'b2b', 'a16z');

sub replace_digits {
    my $str = shift;
    my $length = length($str);
    my $last_letter = substr($str, 0, 1);

    for (my $i = 1; $i < $length; $i++) {
        my $char = substr($str, $i, 1);
        if ($char =~ /\d/) {
            my $new_letter = chr(ord($last_letter) + $char);

            $str =~ s/$char/$new_letter/
        }else{
            $last_letter = $char
        }
    }

    return $str
}

for my $elements (@examples) {
    my $rd = replace_digits $elements;

    say 'Input : str = ', $elements;
    say 'Output : ', $rd;
    say ' ';
}
