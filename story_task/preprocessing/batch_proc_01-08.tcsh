#!/usr/bin/env tcsh
set path = ( $path /data1/software/afni_16.3.05/)

# tcsh -xef proc.tb2994_pass1 |& tee output.proc.tb2994_pass1
tcsh -xef proc.tb3240_pass1 |& tee output.proc.tb3240_pass1
tcsh -xef proc.tb3279_pass1 |& tee output.proc.tb3279_pass1
tcsh -xef proc.tb3512_pass1 |& tee output.proc.tb3512_pass1
tcsh -xef proc.tb3552_pass1 |& tee output.proc.tb3552_pass1
tcsh -xef proc.tb3592_pass1 |& tee output.proc.tb3592_pass1
tcsh -xef proc.tb3602_pass1 |& tee output.proc.tb3602_pass1
