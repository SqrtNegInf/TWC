#!/usr/bin/env raku

sub MAIN (
    @words = <alphabet book carpet cadmium cadeau alpine>
) {
    my @word-arrays = @words.map( *.comb );
    my %result = prefix-hash( @word-arrays );
    .say for traverse( %result );
    
}

sub traverse ( %hash ) {
    my @out;

    for %hash.keys -> $key {
        if ( %hash{$key} ~~ Hash ) {
            my @res = traverse( %hash{$key} );
            @out.push( [ $key, |$_] ) for @res;
        } else {
            @out.push( [ $key, ] );
        }
    }

    return @out.map( *.join("") );
}

sub prefix-hash( @arrays ) {
    my %hash;
    
    for @arrays -> [$key, *@rest] {
        %hash{$key} //= [];
        %hash{$key}.push( @rest );
    }

    for %hash.keys -> $key {
        if %hash{$key}.elems > 1 {
            %hash{$key} = prefix-hash( %hash{$key} );
        }
    }
    return %hash;
}
