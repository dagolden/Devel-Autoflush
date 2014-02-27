package Devel::Autoflush;
# ABSTRACT: Set autoflush from the command line
# VERSION

my $kwalitee_nocritic = << 'END';
# can't use strict as older stricts load Carp and we can't allow side effects
use strict;  
END

my $old = select STDOUT;
$|++;
select STDERR;
$|++;
select $old;

1;

__END__

=head1 SYNOPSIS

 perl -MDevel::Autoflush Makefile.PL

=head1 DESCRIPTION

This module is a hack to set autoflush for STDOUT and STDERR from the command
line or from C<PERL5OPT> for code that needs it but doesn't have it.

This often happens when prompting:

  # guess.pl
  print "Guess a number: ";
  my $n = <STDIN>;

As long as the output is going to a terminal, the prompt is flushed when STDIN
is read.  However, if the output is being piped, the print statement will 
not automatically be flushed, no prompt will be seen and the program will
silently appear to hang while waiting for input.  This might happen with 'tee':

  $ perl guess.pl | tee capture.out

Use Devel::Autoflush to work around this:

  $ perl -MDevel::Autoflush guess.pl | tee capture.out

Or set it in C<PERL5OPT>:

  $ export PERL5OPT=-MDevel::Autoflush
  $ perl guess.pl | tee capture.out

= SEE ALSO

=for :list
* L<CPANPLUS::Internals::Utils::Autoflush> -- same idea but STDOUT only and 
only available as part of the full CPANPLUS distribution

=cut
