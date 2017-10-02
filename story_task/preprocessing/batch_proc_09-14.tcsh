#!/usr/bin/env tcsh
set path = ( $path /data1/software/afni_16.3.05/)

tcsh -xef proc.tb3626_pass1 |& tee output.proc.tb3626_pass1
tcsh -xef proc.tb3646_pass1 |& tee output.proc.tb3646_pass1
tcsh -xef proc.tb3744_pass1 |& tee output.proc.tb3744_pass1
tcsh -xef proc.tb3761_pass1 |& tee output.proc.tb3761_pass1
tcsh -xef proc.tb3784_pass1 |& tee output.proc.tb3784_pass1
tcsh -xef proc.tb3810_pass1 |& tee output.proc.tb3810_pass1
tcsh -xef proc.tb3846_pass1 |& tee output.proc.tb3846_pass1
