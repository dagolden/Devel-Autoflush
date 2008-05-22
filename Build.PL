use strict;
use lib 'inc';
eval "require Pod::WikiDoc";
my $class = $@ ? "Module::Build" : "Module::Build::WikiDoc";
eval "require $class";
$class->new( 
    module_name         => 'Devel::Autoflush',
    dist_author         => 'David A. Golden <dagolden@cpan.org>',
    license             => 'apache',
    create_readme       => 1,
    create_makefile_pl  => 'traditional',
    requires        => {
      perl      => 5.004,
    },
    build_requires  => {
      'IO::CaptureOutput' => 1.08,
      'Test::More' => 0.62,
    },
    meta_add            => { 
        no_index => { 
            directory => [ qw{ examples inc } ],
        } 
    },
)->create_build_script;

