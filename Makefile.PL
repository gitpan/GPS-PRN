use ExtUtils::MakeMaker;
WriteMakefile(
  NAME      => q{GPS::PRN},
  VERSION_FROM => q{lib/GPS/PRN.pm},
  ABSTRACT_FROM => 'lib/GPS/PRN.pm',
  PREREQ_PM => {
                 strict            => 0,
                 vars              => 0,
                 'Test::Simple'    => 0, #Test::More
               },
             );
