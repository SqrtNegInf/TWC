#!/usr/bin/env perl
use strict;
use warnings;

use Test2::V0 -srand => 1;

my $answer_1 =  {  fields => { field1 => "\"value1%\"", field2 => "\"value2\"", field3 => 42 },
  name   => "id", };

my $answer_2 = {
  fields => {
              title  => "\"Title \\\"quoted\\\" done\"",
              title2 => "\"Title2 \\\"quoted\\\" done too\"",
              title3 => "\"Title with escaped backslash \\\"",
            },
  name   => "youtube",
};

my $answer_3 = { name => "empty" };
my $answer_multiline = {
  fields => {
              filed1 => "\"value1\"",
              title  => "\"Title \\\"quoted\\\" done\"",
              title3 => "\"Title with escaped backslash \\\"",
            },
  name   => "id",
  text   => "LINES\nLINES2\nLINES3 with % and {} and \\\"quoted\\\" and escaped backslash \\",
};

is(multiline_parser(q[{%  id   field1="value1%"    field2="value2"  field3=42 %}]),
     $answer_1, 'Example 1');
is(multiline_parser(q[{%  youtube title="Title \"quoted\" done" title2="Title2 \"quoted\" done too" title3="Title with escaped backslash \\" %}]),
     $answer_2, 'Example 2');
is(multiline_parser(q[{% empty %}]), $answer_3, 'Example 3');
is(multiline_parser(q[
{% id  filed1="value1" title="Title \"quoted\" done" title3="Title with escaped backslash \\" %}
LINES
LINES2
LINES3 with % and {} and \"quoted\" and escaped backslash \\
{% endid %}
]), $answer_multiline, 'Example Multiline');
done_testing();

sub multiline_parser
{
     my $tag = $_[0];

     my ($open) = $tag =~  /^\{%\s+(.+?)\s+%\}/ms;
     my ($lines) = $tag =~ /%\}(.+)\{%/ms;
     # probably to check the specification:
     my ($end) = $tag =~ /^\{%\s+(end.+?)\s+%\}/ms;

     die "Cannot parse $tag!$/" unless defined $open;

     $open .= ' '; # Tailing space is eaten by regex above.
     my %output = _tag_parser($open);

     if ( defined $lines ) 
     { 
          $lines =~ s/\A\n//ms;
          $lines =~ s/\n\z//ms;
          $output{text} = $lines; 
     }
     
     return \%output;
}


sub _tag_parser
{
     my $line = $_[0];
     my ($name) = $line =~ /^(\w+)\s+/;
     my %fields;
     while ( $line =~ /(\w+)=(.+?)(?=\s+(?:\w+=|$))/g )
     {
          $fields{$1} = $2;
     }
     my %line_output;
     $line_output{name} = $name;
     if ( scalar keys %fields ) 
     { 
          $line_output{fields} = \%fields; 
     }

     return %line_output;
}
