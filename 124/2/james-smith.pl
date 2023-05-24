#!/usr/bin/env perl
use v5.36;

say match_teams( map { $_*10 } 1..15 );
say match_teams( map { $_*10 } 1..10 );
say match_teams( qw(10 -15 20 30 -25 0 5 40 -5) );
#say match_teams( qw(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97) );

sub match_teams {
  ## Pre-process input
  ##   * Remove first person from list - he will always go in team 1
  ##   * The rest are to be allocated.
  ##   * Pre-compute the maximum size team!
  ##
  ## $best - stores the result!!
  ##
  ## $best->[0] = difference between scores
  ## $best->[1] = array of team 1 members
  ## $best->[2] = array of team 2 members

  my( $diff, @names ) = @_;
  separate( 1 + int( @names/2 ), [$diff], [], $diff, my $best = [1<<63], @names );
  return "Team 1: [@{$best->[1]}]; Team 2: [@{$best->[2]}]; difference $best->[0]";
}

sub separate {
  my( $maxsize, $team1, $team2, $diff, $be, @nums ) = @_;
  return ( $be->[0] > abs $diff ) && ( @{$be} = ( abs $diff, $team1, $team2 ) ) unless @nums;
  ## If we get to the end of the list and have a better solution (smaller diff)
  ## store info in $be - can't just do $be = [ , , ] as this would
  ## change the pointer and wouldn't be preserved....
  my $next = shift @nums;      ## Get the next person and allocate to team 1 and/or team 2 depending
                               ## on whether the teams have space...
  separate( $maxsize, [@{$team1},$next], $team2, $diff+$next, $be, @nums ) if @{$team1} < $maxsize;
  separate( $maxsize, $team1, [@{$team2},$next], $diff-$next, $be, @nums ) if @{$team2} < $maxsize;

  ## We update the difference as we go along to avoid the need to sum the two teams and compute
  ## differences at the end! When we add a member to a team we don't just push but create a new arrayref
  ## by adding the new member to the team array. If we pushed the reference would be the same and
  ## the recursion code would fall over!
}

##
## Timings
##
## #players  rate
##
##  10       2,273/s
##  12         598/s
##  14         157/s
##  16          41/s
##  18          10/s
##  20        2.68/s
##  22        0.57/s
##  24    ~    6s
##  26    ~   23s
##  28    ~   94s
##  30    ~  365s
