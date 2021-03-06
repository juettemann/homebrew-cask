#Template generated on 2018-06-27 14:01:09 +0100
#Do not edit this file. Modify the relevant config and regenerate

require 'digest'

class ProteinFeatures < Formula
  url 'file://'+File.expand_path(__FILE__)
  desc 'Dependencies for the ProteinFeatures formula'
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  version '4'

  depends_on 'ensembl/ensembl/interproscan'
  depends_on 'ensembl/moonshine/seg'

  def install
    File.open('protein-features', 'w') { |file|
      file.write '#!/bin/sh'+"\n"
      deps.each do | dep |
        f = dep.to_formula
        file.write "echo "+[f.full_name, f.version, f.prefix].join("\t")+"\n"
      end
    }
    bin.install 'protein-features'
  end
end
    