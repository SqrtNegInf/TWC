#!/usr/bin/env raku

sub MAIN() {
    #for ^25 {
        my $nu = 42;  #(^100).pick() / 10;
        my $de = 0;   #(^3).pick();
        say "{$nu} / {$de} safe? {safe-division($nu,$de)??"Yes"!!"No"}";
           $de = 1;   #(^3).pick();
        say "{$nu} / {$de} safe? {safe-division($nu,$de)??"Yes"!!"No"}";
    #}
}

sub safe-division( Numeric $nu, Numeric $de ) {
    try {
        ($nu/$de).Str();
        return True;
    }
    return False;
}
