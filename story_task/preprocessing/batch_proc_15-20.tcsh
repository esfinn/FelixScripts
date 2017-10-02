#!/usr/bin/env tcsh
set path = ( $path /data1/software/afni_16.3.05/)

tcsh -xef proc.tb3858_pass1 |& tee output.proc.tb3858_pass1
tcsh -xef proc.tb3920_pass1 |& tee output.proc.tb3920_pass1
tcsh -xef proc.tb3929_pass1 |& tee output.proc.tb3929_pass1
tcsh -xef proc.tb3964_pass1 |& tee output.proc.tb3964_pass1
tcsh -xef proc.tb3977_pass1 |& tee output.proc.tb3977_pass1
