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

  double[] genotype_scores = [0, 0.5, 1];

  writeln("Generating bimbam with sample_size = " , sample_size , " and variant_size = ",
          variant_size , "in file ", file_name);

  File outfile = File(file_name, "w");
  foreach(i; 0..variant_size){
    outfile.write("rs_id", i);
    foreach(j; 0..sample_size){
      outfile.write("\t", genotype_scores[uniform(0,3)]);
    }
    outfile.write("\n");
  }

  outfile.close();

  writeln("exiting!");

}
