#!/usr/bin/env perl
use v5.36;

use List::Util;

package stack 
{  
  sub new
  {
    my $class = shift;
    my $self  = { 'values' => [] };

    bless $self, $class;
    return $self;
  }

  sub push
  {
    my ($self, $value) = @_;
    push(@{$self->{values}}, $value);
  }

  sub pop
  {
    my $self = shift;
    return pop(@{$self->{values}});
  }
  
  sub top
  {
    my $self = shift;
    return ${$self->{values}}[0];
  }
  
  sub min
  {
    my $self = shift;
    my @values = @{$self->{values}};
    
    return List::Util::min @values;
  }

  sub all
  {
    my $self = shift;
    return join(" -> ", @{$self->{values}});
  }
}

my $stack = stack->new();

my $input;

while ($input =  <DATA>)
{
  #print 'stack> '; 
  chomp($input);

  if    ($input =~ /^push\s+(.*)$/)            { $stack->push($_) for split(/\s+/, $1); }
  elsif ($input eq 'pop')                      { $stack->pop; }
  elsif ($input eq 'top')                      { say $stack->top; }
  elsif ($input eq 'min')                      { say $stack->min; }
  elsif ($input eq 'all')                      { say $stack->all; }
  elsif ($input eq 'exit' || $input eq 'quit') { exit; }
}

__END__
push 1 2 3
all
top
pop
top
all
quit
min
