#!/usr/bin/env perl
use v5.36;

my $str = 'a1c1e1';
replace_digits($str);

$str = 'a1b2c3d4';
replace_digits($str);

$str = 'b2b';
replace_digits($str);

$str = 'a16z';
replace_digits($str);

exit 0;

sub replace_digits {
    my $str = shift;

    my $char = '';
    my $new_str = join '', map {
                             my $curr_char = ($_ =~ /[0-9]/)
                                 ? chr(ord($char)+$_)
                                 : $_;
                             $char = $curr_char;
                           } split //, $str;
    printf "'%s' -> '%s'\n",
        $str,
        $new_str;
}
