#Template generated on 2018-01-05 11:31:22 +0000
#Do not edit this file. Modify the relevant config and regenerate

require 'digest'

class EgRnaFeatures < Formula
  url 'file://'+File.expand_path(__FILE__)
  desc 'Dependencies for the EgRnaFeatures formula'
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  version '2'

  depends_on 'ensembl/external/infernal'
  depends_on 'ensembl/external/trnascan'

  def install
    File.open('eg-rna-features', 'w') { |file|
      file.write '#!/bin/sh'+"\n"
      deps.each do | dep |
        f = dep.to_formula
        file.write "echo "+[f.full_name, f.version, f.prefix].join("\t")+"\n"
      end
    }
    bin.install 'eg-rna-features'
  end
end
    