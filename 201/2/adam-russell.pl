#!/usr/bin/env perl
use v5.36;

use AI::Prolog;
use Hash::MultiKey;

MAIN:{
    my $S = 5;
    my $C = "[" . '1, 2, 3, 4, 5' . "]";

    my $prolog = do{
        local $/;
        <DATA>;
    }; 
    $prolog =~ s/_COINS_/$C/g;
    $prolog =~ s/_SUM_/$S/g;
    $prolog = AI::Prolog->new($prolog); 
    $prolog->query("sum(Coins).");
    my %h;
    tie %h, "Hash::MultiKey";
    while(my $result = $prolog->results){
        my @s = sort @{$result->[1]};
        $h{\@s} = undef;
    }
    for my $k ( sort { @{$b} <=> @{$a} } keys %h){
        print "(" . join(",", @{$k}) . ")";
        print "\n";
    }
}

__DATA__
member(X,[X|_]).
member(X,[_|T]) :- member(X,T).

coins(_COINS_).

sum(Coins):-
    sum([], Coins, 0).

sum(Coins, Coins, _SUM_). 

sum(Partial, Coins, Sum):-   
    Sum < _SUM_, 
    coins(L),
    member(X,L),
    S is Sum + X,
    sum([X | Partial], Coins, S). 
