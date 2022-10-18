#!/usr/bin/env raku

use Test;

my @A-z = ( 'a'..'z', 'A'..'Z').flat;
my %seen;
sub _asciify( $c --> Str) {
    if not %seen{$c}:exists {
        my $r = @A-z.first: * ~~ rx:m{$c};
        %seen{$c} = $r.defined ?? $r !! $c;
    }
    %seen{$c}
}

# sub asciify( $str ) 
# Return an altered version of $str: with all Letter chars that can be,
# converted to ASCII by :ignoremark.
sub asciify( Any(Str) $in --> Str ) {
    for $in.comb -> $l { $_ ~= _asciify( $l); }
    return $_;
}

constant TEST=False;
if TEST {
    my @Test = (1..100_000,1..100_000).flat.grep( { $_.chr ~~ rx/<:L>/ });
    plan +@Test;
    for @Test -> $t is rw {
        $t.=chr;
        my $r = _asciify( $t);
        ok ( $r eq $t  or  $r ∈ ('a'..'z', 'A'..'Z').flat), "$t --> $r" ;
    }
    done-testing;
    exit;
}
our &makeover;
BEGIN { &makeover = &asciify; }

sub MAIN( $str ='startᎱ썀ÃÊÍÒÙâÊíÒÙÏĘęଽߗᎭ ᏂߵᎵᎼłǀᎲߺγϯͺʅʄªߺᏐΫάdone') {
    say "Input:  '$str'\nOutput: '", &makeover( $str), "'";
}

