# bimbam_generator
Generate dummy BIMBAM files based on variant size and sample size for GWAS

# Build
```
make
```

# Run

```sh
mkdir test
./build/bimbam_generator --samples=500 --variants=6000 --file=test/samples_500
gzip sample_500.geno.txt
```

# LICENSE

This software is distributed under the [BSD 3-Clause License](LICENSE).

Copyright © 2018, Prasun Anand and Modak Analytics
