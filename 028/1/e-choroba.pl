#!/usr/bin/env perl
use v5.36;

say 'The file content is ', (-T $0) ? 'ascii' : 'binary', '.';

