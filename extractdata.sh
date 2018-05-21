#!/bin/bash
# -*- coding: utf-8 -*-

# Code: extract data from UMI embryo data
# Baihan Lin
# Columbia University
# Apr 2018

rename=model;
for f in `ls *.m`
do
	# echo $f
    # woname=${f//.txt/}
    #echo $woname
    
    # new=$rename\_$f
    new=${f/modelNN/NN}

    #echo $new
	mv $f $new
done
