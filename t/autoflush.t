# Copyright (c) 2008 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

use strict;
use warnings;

use Test::More;
use IO::CaptureOutput qw/qxx/;

plan tests => 1;

$ENV{PERL5OPT}='-MDevel::Autoflush';

my ($stdout, $stderr) = qxx($^X, '-we', 'print $| ? 1 : 0,  "\n"');
chomp($stdout);
is( $stdout, 1, "autoflush was set" ) or diag "STDERR: $stderr";

