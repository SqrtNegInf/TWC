#!/usr/bin/env raku

# Create a script that accepts two strings, let us call it, “stones” and “jewels”.
# It should print the count of “alphabet” from the string “stones” found in the string “jewels”.
# For example, if your stones is “chancellor” and “jewels” is “chocolate”, then the script
# should print “8”. To keep it simple, only A-Z,a-z characters are acceptable. Also make the
# comparison case sensitive.


#sub MAIN ($string1 where { m/^<[a..z]>+$/ } , $string2 where { m/^<[a..z]>+$/ } ) {
my $string1 = 'chancellor'; my $string2 = 'chocolate';

    say my @string1 = $string1.comb;
    say my @string2 = $string2.comb;
        my $count   = 0;

    for @string1 -> $i {
        $count++ if @string2.grep: { $_ eq $i };
    }

    say $count;
#}
