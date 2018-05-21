#!/bin/bash
# -*- coding: utf-8 -*-

# Code: extract data from UMI embryo data
# Baihan Lin
# Columbia University
# Apr 2018

cd data/

for f in `ls E3*`
do
	cut -f2- $f > trimmed-$f
done
paste trimmed-E3* | tr -s ' ' > data_E3.txt

for f in `ls E4*`
do
	cut -f2- $f > trimmed-$f
done
paste trimmed-E4* | tr -s ' ' > data_E4.txt

for f in `ls E5*`
do
	cut -f2- $f > trimmed-$f
done
paste trimmed-E5* | tr -s ' ' > data_E5.txt

for f in `ls E6*`
do
	cut -f2- $f > trimmed-$f
done
paste trimmed-E6* | tr -s ' ' > data_E6.txt

for f in `ls E7*`
do
	cut -f2- $f > trimmed-$f
done
paste trimmed-E7* | tr -s ' ' > data_E7.txt

# dependent on the scRNA processed data
