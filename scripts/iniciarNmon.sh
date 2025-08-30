#!/bin/bash

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

outfile="nmon_logs/$1/output_${timestamp}.nmon"

nmon -F "$outfile" -s 1


