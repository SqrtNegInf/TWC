#!/usr/bin/env perl
use v5.36;

tie my $x, 'HistoricalScalar';
$x = 10;
$x = 20;
$x -= 5;
untie $x;

package HistoricalScalar;
sub TIESCALAR # obj creation (tie $scalar, 'NAME', args)
{
    my $class = shift;

    my $self;
    $self->{_ARRAY} = [];
        
    return bless $self, $class;
}
sub FETCH # retrieve values
{
    my $self = shift;
    return $self->{_ARRAY}->[-1];
}
sub STORE # stores values
{
    my $self = shift;
    my $input = shift;     
    push @{$self->{_ARRAY}}, $input;
}
sub UNTIE # indicate no longer need tied variable (untie $@%var;)
{
    my $self = shift;
    print "History:\n";
    foreach my $val (@{$self->{_ARRAY}})
    {
        print "\t->\t$val\n";
    }
}
sub DESTROY # clean up (undef $@%var;)
{
    my $self = shift;
}


