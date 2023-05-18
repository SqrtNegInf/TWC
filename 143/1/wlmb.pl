#!/usr/bin/env perl
use v5.36;

use Scalar::Util qw(looks_like_number);
use Try::Tiny;

my $original_string;
my $previous;
my $current;
my $token;
foreach ('2+2'){
    try {
        $original_string=$previous=$current=$_;
        token();
        my $result=expression();
        die "Extra characters: $previous\n" if defined $token->[0];
        say "$original_string=$result";
    }
    catch {
        warn $_;
    };
}

sub token {
    $previous=$current;
    $token=[$1,$1], return if $current=~s{^\s*([()*/+-])}{}; # symbol
    $token=['N',$1], return
        if $current=~s{^\s*([^()*/+\-\t\n ]*)}{}
           and looks_like_number($1); # number?
    $token=[undef,undef], return if $current=~/^\s*$/; # nothing
    die "Unrecognizable input: $previous\n";
}

sub expression {
    my $result=term();
    while(1){
        my $op=$token->[0];
        last unless defined $op && $op=~m{[+-]};
        token();
        $result+=term(),next if $op eq '+';
        $result-=term(),next if $op eq '-';
    }
    return $result;
}

sub term {
    my $result=simple();
    while(1){
        my $op=$token->[0];
        last unless defined $op && $op=~m{[*/]};
        token();
        $result*=simple(),next if $op eq '*';
        $result/=simple(),next if $op eq '/';
    }
    return $result;
}
sub simple {
    my $op=$token->[0];
    my $val=$token->[1];
    die "Unrecognized expression: $previous\n" unless defined $op && $op=~/[-+(N]/;
    token();
    return -simple() if $op eq '-'; # unary -
    return simple() if $op eq '+';  # unary +
    return $val if $op eq 'N';      # number
    my $result=expression();        # parenthesized expression
    $op=$token->[0];                # closing parenthesis should follow
    die "Unbalanced parenthesis: $previous\n" unless defined $op and $op eq ')';
    token();
    return $result;
}
