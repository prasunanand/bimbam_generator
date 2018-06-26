# bimbam_generator
Generate dummy BIMBAM files based on variant size and sample size for GWAS

# Build
```
make
```

# Run

```sh
mkdir example
./build/bimbam_generator --samples=500 --variants=6000 --file=example/samples_500
gzip sample_500.geno.txt
```

# Specifications

## Parameters

`--samples` defines the number of samples in the study.

`--variants` defines the number of variants in the study

## Output files

* `sample.geno.txt` refers to bimbam genotype file. The first entry in a row refers to SNP ID , the second entry is Reference allele
and the third entry is alternate allele. The remaing entry consists of Genotype values {0, 0.5, 1}. Total number of rows is `variant_size`. Total number of columns is `sample_size + 3`. 

* `sample.pheno.txt` refers to pheno file.  Total number of rows is `sample_size`. The phenotype file is adjusted such that we have 66% cases and 33% controls.

* `sample.covariates.txt` contains two covariates column. Total number of rows is `sample_size`.

* `sample.snps.txt` contains the snp details. It can be used also be used as an annotation file. The first column referes to SNP ID , the second col referes to chromosome position, the third column referes to chromose name.


# LICENSE

This software is distributed under the [BSD 3-Clause License](LICENSE).

Copyright © 2018, Prasun Anand and Modak Analytics
