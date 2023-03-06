#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say);
use Test::More;
use Benchmark qw(cmpthese timethis);

my @TESTS = (
  [ [qw(00:00 23:55 20:00      )],  5 ],
  [ [qw(01:01 00:50 00:57      )],  4 ],
  [ [qw(10:10 09:30 09:00 09:55)], 15 ],
  [ [qw(07:52 03:22 02:59 21:40 22:58 06:22 19:05 21:23 11:50 01:02
        00:52 20:40 13:39 11:00 03:29 11:57 18:46 13:54 18:57 12:17
        13:12 14:56 14:58 08:53 14:15 10:46 14:33 09:50 07:41 15:58
        21:14 19:35 10:42 09:11 17:07 17:34 03:52 19:30 22:06 16:27
        00:39 03:12 04:28 08:51 17:23 10:17 19:46 15:57 09:01 16:07
        21:16 09:59 03:18 07:57 10:28 12:55 09:22 14:51 23:11 17:06
        18:29 06:55 19:01 21:38 17:45 15:07 21:11 06:27 18:10 08:47
        11:20 19:36 02:12 04:39 08:36 05:37 14:35 04:05 20:15 03:34
        13:23 11:08 19:00 15:56 08:43 12:34 21:09 05:45 18:59 22:30
        07:11 19:18 06:19 13:22 04:22 15:54 17:41 23:55 19:27 07:17
    )], 1 ],
  [ [qw(14:54 21:04 16:52 20:19 03:12 15:15 00:19 00:22 11:37 09:48
        11:44 08:42 16:14 10:49 11:43 00:35 13:09 04:03 05:42 15:52
        02:18 06:32 13:00 00:31 20:21 09:23 07:37 09:59 13:42 14:46
        19:36 04:19 03:17 15:35 09:52 06:58 10:44 18:49 09:40 02:02
        01:18 02:16 07:19 19:41 14:33 13:41 17:19 20:08 07:17 18:30
        17:18 21:49 14:35 15:53 11:34 12:48 07:55 06:40 06:04 14:10
        02:57 08:35 17:41 11:10 22:44 07:40 02:22 17:10 09:18 16:26
        23:40 02:35 03:37 18:52 07:35 22:24 14:22 02:01 05:19 02:31
        12:26 06:44 00:18 01:58 05:00 01:12 06:16 11:23 04:05 18:34
        00:53 10:20 03:05 14:20 02:48 20:03 18:11 11:35 23:23 19:04
        12:14 20:09 20:06 20:30 19:35 06:22 06:10 14:18 12:01 04:26
        21:47 16:10 02:21 12:08 17:47 08:55 13:48 04:34 19:10 15:07
        13:53 15:58 15:09 05:43 10:21 13:08 00:10 04:14 11:02 03:04
        04:32 21:36 06:50 17:33 14:52 19:06 10:07 00:04 04:38 02:10
        09:24 18:42 16:40 04:52 16:05 03:40 09:17 23:49 09:29 19:07
        14:24 10:01 12:31 04:27 05:59 13:05 05:33 19:15 15:24 01:45
        12:55 21:41 08:20 06:21 12:13 15:36 02:50 18:01 15:18 17:09
        19:22 23:26 10:34 06:17 17:05 23:07 00:05 19:55 01:10 02:00
        00:47 02:30 00:24 20:24 22:11 04:04 15:48 15:03 00:09 12:51
        16:18 08:24 15:30 06:12 01:31 08:18 19:03 07:39 20:05 14:36
        19:58 17:29 09:28 20:51 03:24 02:46 00:11 08:31 04:31 02:32
        02:44 18:33 16:47 19:59 17:06 08:22 06:34 23:10 00:17 06:41
        01:26 03:06 23:50 06:37 01:54 23:51 12:52 13:49 13:01 16:41
        20:39 07:21 22:52 11:39 11:17 08:26 22:13 02:34 05:11 15:14
        18:58 12:35 20:46 06:00 05:04 13:22 04:41 05:54 18:36 01:19
        01:21 22:02 14:59 04:30 06:49 05:16 03:32 02:58 08:52 16:49
        11:07 17:00 18:39 14:21 12:43 00:51 10:35 06:06 22:19 04:02
        01:44 23:35 11:20 15:40 07:29 05:28 17:49 01:03 04:21 02:43
        02:36 13:50 07:18 20:16 23:38 09:51 06:13 21:55 02:45 14:23
        17:50 16:01 03:56 21:27 21:17 15:19 22:39 04:24 04:47 05:27
        07:44 15:28 15:41 23:00 13:20 20:41 12:05 21:00 21:56 05:39
        20:40 21:38 04:51 09:22 17:01 16:16 07:24 16:02 10:26 23:17
        04:35 16:21 01:49 12:04 02:39 12:18 06:25 23:47 12:12 15:43
        13:16 02:08 05:13 15:01 11:27 23:15 13:56 18:15 20:45 18:53
        07:16 12:53 14:08 13:43 22:42 22:55 01:53 14:37 01:34 08:59
        09:09 11:41 10:32 09:06 03:27 10:59 13:28 14:40 09:26 05:35
        00:01 08:45 22:59 18:55 02:11 07:59 16:44 17:57 16:15 18:10
        22:38 16:56 02:25 14:03 21:25 12:49 07:56 03:02 10:05 08:36
        02:54 14:45 04:54 14:50 23:02 23:05 23:27 22:12 20:47 07:22
        08:03 14:48 19:56 12:17 15:49 22:25 16:12 04:23 18:18 01:39
        21:39 22:15 11:14 00:28 21:34 20:17 22:20 10:12 19:29 05:21
        07:57 10:17 20:48 17:17 23:12 09:49 23:42 03:46 01:59 19:19
        18:20 17:36 16:23 03:34 11:31 06:20 16:48 11:12 05:49 14:58
        11:48 22:57 01:11 06:19 07:51 09:41 18:17 23:21 21:29 06:48
        19:11 07:32 17:02 18:50 19:20 04:15 14:53 15:12 06:54 19:54
        08:08 21:26 15:29 22:40 21:13 04:56 07:14 06:26 05:03 09:21
        11:26 09:47 08:25 23:34 13:18 06:02 03:29 02:56 09:01 07:50
        15:50 06:27 20:36 05:02 19:09 13:38 08:32 10:14 00:45 03:26
        18:25 07:13 09:08 05:47 04:08 16:55 03:03 09:05 19:37 02:26
        19:39 23:55 23:08 21:48 01:02 05:55 21:57 23:29 01:20 03:48
        13:34
    )], 1 ],
);

is( shortest_time(          @{$_->[0]} ), $_->[1] ) for @TESTS;
is( shortest_time_sort_str( @{$_->[0]} ), $_->[1] ) for @TESTS;
is( shortest_time_sort_num( @{$_->[0]} ), $_->[1] ) for @TESTS;

done_testing();

cmpthese( -10, {
  'st'     => sub { shortest_time(          @{$_->[0]} ) for @TESTS },
  'st_str' => sub { shortest_time_sort_str( @{$_->[0]} ) for @TESTS },
  'st_num' => sub { shortest_time_sort_num( @{$_->[0]} ) for @TESTS },
} );

sub shortest_time {
  my $min = 1_440, @_ = map { @Q = split /:/; $Q[0]*60 + $Q[1] } @_;
  while( defined (my $t = shift) ) {
    abs( $t-$_       ) < $min && ( $min = abs $t-$_       ),
    abs( $t+$_-1_440 ) < $min && ( $min = abs $t+$_-1_440 ) for @_;
  }
  $min
}

sub shortest_time_sort_str {
  @_ = map { my @Q = split /:/; $Q[0]*60 + $Q[1] } sort @_;
  my $min = 1440 + (my $t = shift) - $_[-1];
  ($_-$t<$min) && ($min=$_-$t), $t=$_ for @_;
  $min
}
or:

sub shortest_time_sort_num {
  @_ = sort { $a<=>$b } map { my @Q = split /:/; $Q[0]*60 + $Q[1] } @_;
  my $min = 1440 + (my $t = shift) - $_[-1];
  ($_-$t<$min) && ($min=$_-$t), $t=$_ for @_;
  $min
}
