#!/usr/bin/env raku

sub MAIN( *@input ) {
    my $string = process_input(@input);
    $string ||= "aaaBBaacXXyz";                 ## default processed input
    my @palins = get_all_palindromes($string);

    my @solutions;
    get_lists($string, [], @solutions, @palins);

    .put for @solutions;
}

sub get_all_palindromes ( $string ) {
    my @matches =  $string ~~ m:ex/ (.+) {} .? "{$0.flip if $0}" /;  # DH add 'if' to silence warning
    my @list = @matches.map: {.Str};
    return @list.unique;
}

sub get_lists ($string, @list, @solutions, @palins) {
## recursively walk lists of combinations of palindrome matches

    my $joined = @palins.join: '||';
    unless $string ~~ m/<$joined>/ {
        @solutions.push: @list;
        return;
    }
    for ( @palins) -> $item {
        if ($string ~~ m/$item/) {
            my @newlist = @list;
            @newlist.push: $item ;
            get_lists( $/.postmatch, @newlist, @solutions, @palins);
        }
    }
}

sub process_input ( @input ) {
    my $string = @input.join;
    $string ~~ s:g/\W//;
    return $string;
}
