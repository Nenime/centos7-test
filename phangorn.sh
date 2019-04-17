#!/bin/bash

echo -e "\e[1;32mTesting phangorn...\e[0m"
mkdir -p output/phangorn
Rscript files/phangorn/plot.r && echo -e "\e[1;32mR/phangorn OK\e[0m" || "\e[1;31mR/phangorn failed\e[0m"
