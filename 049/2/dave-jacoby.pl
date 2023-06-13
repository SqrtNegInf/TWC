#!/usr/bin/env perl
use v5.36;

use utf8;

my $lru = LRU->new(3);

$lru->set( 1, 3 );
$lru->set( 2, 5 );
$lru->set( 3, 7 );

say join ': ', 1, $lru->get(1);
say join ': ', 2, $lru->get(2);
say join ': ', 3, $lru->get(3);
say join ': ', 4, $lru->get(4);

$lru->list();

$lru->set( 4, 9 );
say $lru->get(1);
$lru->list();
say $lru->get(4);
$lru->list();
$lru->set( 'key', 'val' );
$lru->list();
$lru->dump();

package LRU;

use Carp;
use JSON;

sub new ( $class, $capacity = 3 ) {
    $capacity = int $capacity;
    croak 'Invalid capacity' if $capacity < 1;
    my $self = {};
    $self->{class}    = $class;
    $self->{cache}    = {};
    $self->{order}    = [];
    $self->{capacity} = $capacity;
    $self->{max}      = $capacity - 1;
    return bless $self;
}

sub set ( $self, $key, $value ) {
    my @array = grep { $_ ne $key } $self->{order}->@*;
    unshift @array, $key;
    $#array              = $self->{max} if $#array > $self->{max};
    $self->{order}->@*   = @array;
    $self->{cache}{$key} = $value;

    for my $k ( keys $self->{cache}->%* ) {
        my $f = grep { $_ eq $k } $self->{order}->@*;
        delete $self->{cache}{$k} if $f == 0 ;
    }
    $self->list();
}

sub get ( $self, $key ) {
    my $n = grep { $_ eq $key } $self->{order}->@*;
    my $flag = $n ? 1 : 0;
    return -1 unless $flag;
    my @array = grep { $_ ne $key } $self->{order}->@*;
    unshift @array, $key;
    $#array = $self->{max} if $#array > $self->{max};
    $self->{order}->@* = @array;
    $self->list();
    return $self->{cache}{$key};
}

sub list ($self) {
    say '  LIST:  ' . join ', ', $self->{order}->@*;
}

sub dump ($self) {
    my $json = JSON->new->pretty->canonical;
    say $json->encode(
        {
            cache => $self->{cache},
            order => $self->{order},
        }
    );
}
