#!/usr/bin/env perl
use warnings;
use strict;
use feature qw{ say };

say 'The file content is ', (-T $0) ? 'ascii' : 'binary', '.';

