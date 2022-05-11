#!/usr/bin/env raku

srand 1;

sub binarySearch(@haystack,  $needle) {
    if @haystack.elems {
        my $mid = (@haystack.elems / 2).Int; 

        if $needle eq @haystack[$mid] { 
            return True;
        }

        if $needle gt @haystack[$mid] { 
            return binarySearch(@haystack[$mid + 1 .. *], $needle);
        } 

        return binarySearch(@haystack[0 .. $mid - 1], $needle);
    }
    return False;
}

sub MAIN() {
    my @letters = ('a' .. 'z');
    my @haystack = 'hatodlrfkpcjb';  #@letters.pick(@letters.elems / 2);
    my $needle = 'r'; #@letters.pick;

    say "is $needle in ", @haystack.join, '?';
    say binarySearch(@haystack.sort, $needle) ?? 'Yes.' !! 'No.';
}

