module bimbam_generator.app;

import std.getopt;
import std.stdio;
import std.random;

void main(string[] args){
  size_t sample_size, variant_size;
  string file_name;

  getopt(args,
    "samples" , &sample_size,
    "variants", &variant_size,
    "file"    , &file_name
  );

  geno_generator(sample_size, variant_size, file_name ~ ".geno.txt");
  pheno_generator(sample_size, file_name ~ ".pheno.txt");
  covariates_generator(sample_size, file_name ~ ".covariates.txt");
  annotation_generator(variant_size, file_name ~ ".snps.txt");
}

void geno_generator(size_t sample_size, size_t variant_size, string file_name){
  double[] genotype_scores = [0, 0.5, 1];
  char[] alleles = ['X', 'Y'];

  writeln("Generating bimbam with sample_size = " , sample_size , " and variant_size = ",
          variant_size , "in file ", file_name);

  File outfile = File(file_name, "w");
  foreach(i; 0..variant_size){
    outfile.write("rs_id", i);
    outfile.write("\t", alleles[uniform(0,2)]);
    outfile.write("\t", alleles[uniform(0,2)]);
    foreach(j; 0..sample_size){
      outfile.write("\t", genotype_scores[uniform(0,3)]);
    }
    outfile.write("\n");
  }

  outfile.close();

  writeln("exiting!");
}

void pheno_generator(size_t sample_size, string file_name){
  writeln("Generating phenotype with sample_size = " , sample_size , "in file ", file_name);
  File outfile = File(file_name, "w");
  bool[] coin_toss = [true, false, true];
  Random gen;
  foreach(i; 0..sample_size){
    if(coin_toss[uniform(0,3)]){
      outfile.writeln(uniform(0, 12.0, gen));
    }
    else{
      outfile.writeln("NA");
    }
  }
  writeln("exiting!");
}

void annotation_generator(size_t variant_size, string file_name){
  writeln("Generating annotation files with variant_size = ", variant_size , "in file ", file_name);

  File outfile = File(file_name, "w");
  foreach(i; 0..variant_size){
    outfile.writeln("rs_id", i, "\t", "pos", i, "\t", 1);
  }

  outfile.close();

  writeln("exiting!");

}

void covariates_generator(size_t sample_size, string file_name){
  writeln("Generating covariates file with sample_size = " , sample_size , "in file ", file_name);
  File outfile = File(file_name, "w");
  int[] covar_score = [-1, 0, 1, -1, 0, 1,-1, 0, 1,-1, 0, 1, 2, 3, 4, 5, 6, 7, 8];
  Random gen;
  foreach(i; 0..sample_size){
    foreach(j; 0..2){
      outfile.writeln(covar_score[uniform(0,19)], "\t", covar_score[uniform(0,19)]);
    }
  }
  writeln("exiting!");
}
