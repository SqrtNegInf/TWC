#!/usr/bin/env perl
use v5.36;

{
    package LoggingScalar;
    sub TIESCALAR {
        my($class, $value) = @_;
        return bless [$value], $class;
    }
    sub FETCH {
        my($self) = @_;
        return $self->[-1];
    }
    sub STORE {
        my($self, $value) = @_;
        push @$self, $value;
    }
    sub show_hist {
        my($self) = @_;
        say join(" ", @$self);
    }
}

tie my $x, 'LoggingScalar', 10;
$x = 20;
$x -= 5;
tied($x)->show_hist();
