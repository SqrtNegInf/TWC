#!/usr/bin/env raku

use Test;

constant TEST=True;
if TEST {
    my @Test =
        {   in  => [ qw<ab1234>], exp => [ qw<001234>] },
        {   in  => [ qw<ab1234 cd5678>], exp => [ qw<001234 015678 >] },
        {   in  => [ qw<cd5678 ab1234>], exp => [ qw<005678 011234 >] },
        {   in  => [ qw<ab1234 cd5678 ef1342>],
            exp => [ qw<001234 015678 021342>] },
        {   in  => [ qw<pq1122 rs3334>], exp => [qw<001122 013334>] },
        {   in  => [ qw<aa1234 ab5678 bb1342 ac1234 ab1234> ],
            exp => [ qw<001234 015678 021342 031234 011234> ] },
        {   in  => [ qw<aa0001 ab0002 bb0004 ac0005 ab0003 > ],
            exp => [ qw<000001 010002 020004 030005 010003> ] },
   ;
   my @Poison =  'Empty' => Empty ;

    plan +@Test + @Poison;
    for @Test -> %t {
         my @g = convert( %t<in>);
        is-deeply @g, %t<exp>,  " %t<in> --> @g[]";
    }
    for @Poison -> %t {
        dies-ok { convert  @%t.value },  "%t.key()";
    }
    done-testing;
}

sub MAIN( @list = ( 'ab1234', 'cd5678', 'ef1342') ) {
   say "Input: \@list = @list.raku()";
   say "Output: ", convert(@list).raku();
}

sub convert( @a where (.defined and (+$_ ≠ 0) ) --> List ) {
    my @return;
    my %seen;
    my $current = -1;
    my sub see( $s --> Str ) { %seen{$s} = sprintf "%02d", ++$current; }
    my regex head { <:Ll>**2}
    my regex tail { <:Nd>**4}
    for @a -> Str $e {
        if $e ~~ /:r ^ <head> <tail> $ / {
            $_ = %seen{$<head>}:exists ?? %seen{$<head>}
                                       !! see $<head>;
            @return.push: $_ ~ $<tail>;
        } else {
            die qq{Ill formed } ~ $e;
        }
    }
    return @return.List;
}

