#!/usr/bin/env perl
use v5.36;

my $file = 'phone-numbers.txt';
#GetOptions( 'file=s' => \$file, );

if (open my $fh, '<', $file ) {

    # remove newlines from the numbers 
    my @numbers = map { chomp $_; $_ } <$fh>;
    close $fh;
    say join "\n", ( grep { is_phone_number($_) } @numbers ), '';
}

sub is_phone_number( $string ) {
    return 1 if $string =~ m{
        ^\ *    # starts with maybe space
        \d{4}   # then has four digits 
        \       # then one space
        \d{10}  # then has ten digits 
        \s*$    # with maybe ending spaces
        }mix;
    return 1 if $string =~ m{
        ^\ *    # starts with maybe space
        \+\d{2} # then has a plus sign and two digits 
        \ +     # then one or more space
        \d{10}  # then has ten digits 
        \s*$    # with maybe ending spaces
        }mix;
    return 1 if $string =~ m{
        ^\ *        # starts with maybe space
        \(\d{2}\)   # then has two digits within parens
        \ +         # then one or more space
        \d{10}      # then has eight digits 
        \s*$        # with maybe ending spaces
        }mix;
    return 0;
}
