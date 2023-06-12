#!/usr/bin/env perl
use v5.36;

use AI::Prolog;
use constant TARGET => 0; 
use constant NUMBERS => "-25, -10, -7, -3, 2, 4, 8, 10"; 
my $prolog = do{
    local $/;
    <DATA>;
}; 
my $numbers = NUMBERS; 
$prolog =~ s/NUMBER_LIST/$numbers/; 
$prolog = AI::Prolog->new($prolog); 
$prolog->query("unique_triplets(X, Y, Z, " . TARGET . ").");
my $result = $prolog->results;
my($x, $y, $z) = @{$result}[1 .. @{$result} - 1];
print "X: $x\nY: $y\nZ: $z\n";

__DATA__
member(X,[X|T]).
member(X,[H|T]) :- member(X,T).
numbers([NUMBER_LIST]).
unique_triplets(X, Y, Z, T) :-
    numbers(L), 
    member(X, L),
    member(Y, L),
    member(Z, L),
    X <= Y,
    Y <= Z,
    X <= Z,
    T is X + Y + Z.
