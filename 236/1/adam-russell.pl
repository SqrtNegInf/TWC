#!/usr/bin/env perl

use v5.36;

use boolean;
use constant COST_JUICE => 5;

sub exact_change{
    my @bank;
    my $current_customer = shift;
    { 
        push @bank, $current_customer if $current_customer == COST_JUICE;
        if($current_customer > COST_JUICE){
            my $change_due = $current_customer - COST_JUICE;
            my @bank_sorted = sort {$a <=> $b} @bank;
            my @bank_reserved;
            {
                my $bill = pop @bank_sorted;
                push @bank_reserved, $bill if $change_due < $bill;
                $change_due -= $bill if $change_due >= $bill;
                redo if @bank_sorted;
            } 
            return false if $change_due != 0;
            @bank = @bank_reserved;
            push @bank, $current_customer;
        }
        $current_customer = shift; 
        redo if $current_customer;
    }
    return true;
}


MAIN:{
    say exact_change 5, 5, 5, 10, 20;
    say exact_change 5, 5, 10, 10, 20;
    say exact_change 5, 5, 5, 20;
}
