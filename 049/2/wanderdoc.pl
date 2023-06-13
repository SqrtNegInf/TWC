#!/usr/bin/env perl
use v5.36;

package LRU
{
     use Scalar::Util qw(refaddr looks_like_number);
     use Carp;
     my (%DATA, %MAP, %CAPACITY); 

     sub new
     {
          my ($class, $capacity) = @_;

          confess "Capacity must be a positive integer!$/"
               unless ( looks_like_number($capacity) 
                    and $capacity > 0
                    and int($capacity) == $capacity);

          my $ref = bless \do{my $dummy}, $class;
          $CAPACITY{refaddr $ref} = $capacity;

          return $ref;
     }
     



     sub get_capacity
     {
          my $self = shift;

          return $CAPACITY{refaddr $self};
     }



     sub set
     {
          my ($self, $key, $value) = @_;
          push @{ $DATA{refaddr $self} }, {$key => $value};
          while ( scalar @{ $DATA{refaddr $self} } > $CAPACITY{refaddr $self} )
          {
               shift @{ $DATA{refaddr $self} };
          }

          $self->_update_map;
     }


     sub get
     {
          my ($self, $key) = @_;
          $self->_update_map;

          return -1 if not exists $MAP{refaddr $self}{$key};

          my $idx = $MAP{refaddr $self}{$key};
          my $value = $DATA{refaddr $self}[$idx]->{$key};
          my $last = splice( @{$DATA{refaddr $self}}, $idx, 1);
          push @{$DATA{refaddr $self}}, $last;
          $self->_update_map;
          return $value;
     }

     sub _update_map
     {
          my $self = shift;
          %{$MAP{refaddr $self}} = 
               map { my ($k) = keys %{$DATA{refaddr $self}[$_]}; $k => $_;} 
               0 .. $#{ $DATA{refaddr $self} };
     }

     sub print_cache
     {    
          my $self = shift;

          my @cache_stringified = 
               map { my ($k, $v) = each %{$DATA{refaddr $self}[$_]}; 
               qq["<${k}"=>${v}>]; } 
               0 .. $#{ $DATA{refaddr $self} };

          print "least recently used ", 
               join(" ", @cache_stringified), " most recently used", $/;

     }

     sub DESTROY
     {
          my $self = shift;
          delete $DATA{refaddr $self};

          delete $CAPACITY{refaddr $self};
          delete $MAP{refaddr $self};
     }
1;
}





package main
{
     my $cache = LRU->new(3);

     print "DEBUG: Cache capacity: ", $cache->get_capacity, $/;

     $cache->set(1, 3);
     $cache->set(2, 5);
     $cache->set(3, 7);


     print qq[$/After first filling ... $/];
     $cache->print_cache();

     print qq[$/Getting "2" ... ];
     print $cache->get(2), $/;


     print qq[$/After getting "2" ... $/];
     $cache->print_cache();
     
     print qq[$/Getting "1" ... ];
     print $cache->get(1), $/;

     print qq[$/After getting "1" ... $/];
     $cache->print_cache();     

     print qq[$/Getting "4" ... ];
     print $cache->get(4), $/;

     print qq[$/After getting "4" ... $/];
     $cache->print_cache();
     
     $cache->set(4, 9);

     print qq[$/After setting "4" ... $/];
     $cache->print_cache();
     
     print qq[$/Getting "3" ... ];
     print $cache->get(3), $/;

     print qq[$/After getting "3" ... $/];
     $cache->print_cache();
}
