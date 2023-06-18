#!/usr/bin/env perl
use v5.36;

#Remove empty braces before processing using substitution
#    The /r returns the result without modifying the $ARGV[0] variable
#Then the resulting string will be used in recusrive function expand
expand('Perl {Daily,Weekly,Monthly,Yearly} Challenge'=~s/{}//gr);

sub expand {
    #The string will be stored in $string
    my $string = shift;

    #- Regex was used to check if the string contains matching braces
    #- Notice that [^{}]* instead of a simple .* to match the contents of the braces
    #      this is to make sure that the inner most brace is processed first
    #- The matching string was captured using () and will be stored in $1
    if ($string =~ /{([^{}]*)}/) {
        # The captured value, the prematch and postmatch were stored
        # in variables $l,$m and $r respectively
        my ($l,$m,$r) = ($`,$1,$');
        # The captured value stored in $m was split using comma(,) as delimiter
        # The resulting list was used in a for loop
        for (",$m"=~/,([^,]*)/g) {
            #A new string containing the prematch, a value from the split operation of $m
            #and the postmatch will be used in the recursive function.
            #The process will be repeated until...
            expand($l.$_.$r);
        }
    } else {
        #The string does not have matching braces.
        #Then final string will be printed
        say $string;
    }
}
