#!/usr/bin/env perl
use v5.36;

{
use strict;
package Stack;

sub new {
    my ($class) = @_;
    bless {
        _values => $_[1],  #a reference to an array
    }, $class;
}

sub pop { 
    my @arr = @{$_[0]->{_values}};
    my $a = $arr[-1];
    delete ${$_[0]->{_values}}[-1];
    return $a;
}

sub push {
    push @{$_[0]->{_values}}, $_[1];

}

sub top {
    my @arr = @{$_[0]->{_values}};
    return $arr[-1];    
}

sub min {
    my @arr = @{$_[0]->{_values}};
    my $m = $arr[0];
    for (@arr) {$m = $_ if $_ < $m};
    return $m;
}

}  #end of package Stack




# codes from the Example Run:
my $stack = Stack->new;

$stack->push(2);
$stack->push(-1);
$stack->push(0);
$stack->pop;       # removes 0
print $stack->top; # prints -1
$stack->push(0);
print $stack->min; # prints -1

