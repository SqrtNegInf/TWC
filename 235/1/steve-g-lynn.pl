#!/usr/bin/env perl
#use v5.36; # DH Perl 4 compat?

print &remove_one(0,2,9,4,6); #1
print &remove_one(5,1,3,2); #0
print &remove_one(2,2,3); #1

sub remove_one {
    #-- helper sub
    local *ascending = sub {
        local @ascending=(sort {$a <=> $b} @_);
        foreach (0 .. $#_) {($_[$_]==$ascending[$_]) || (return 0)} 
        return 1;
    };

    #-- trunk of sub
    foreach (0 .. $#_){
        local @remove_one = @_;
        splice(@remove_one,$_,1);
        &ascending(@remove_one) && (return 1);
    }
    return 0;
}

