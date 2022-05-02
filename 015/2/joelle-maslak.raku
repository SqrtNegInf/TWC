#!/usr/bin/env raku

#sub MAIN(Str:D $key where { $_ ~~ m:i/^ <[a..z]>+ $/ } = 'LEMON', Bool :$decrypt? ) {
    my $decrypt = False;
    my $key  = 'LEMON';
    my @key-chars = $key.fc.comb;

    my @input = 'ATTACKATDAWN'.comb;

    for @input -> $c {
        my $offset = @key-chars[0].ord - 'a'.ord;
        $offset = 26 - $offset if $decrypt;
    
        if $c ~~ m/ <[a..z]> / {
            @key-chars.append: @key-chars.shift;  # Circular buffer
            my $new = $c.ord + $offset;
            $new -= 26 if $new > 'z'.ord;
            print $new.chr;
        } elsif $c ~~ m/ <[A..Z]> / {
            @key-chars.append: @key-chars.shift;  # Circular buffer
            my $new = $c.ord + $offset;
            $new -= 26 if $new > 'Z'.ord;
            print $new.chr;
        } else {
            print $c;
        }
    }
#}
