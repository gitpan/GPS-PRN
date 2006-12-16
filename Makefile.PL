use ExtUtils::MakeMaker;
WriteMakefile(
  NAME      => q{GPS::PRN},
  VERSION_FROM => q{lib/GPS/PRN.pm},
  PREREQ_PM => {
                 strict            => 0,
                 vars              => 0,
               },
               ($] >= 5.005 ? 
                 (
                   ABSTRACT_FROM => 'lib/GPS/PRN.pm',
                 ) : ()
               ),
             );
