#Template generated on 2016-11-18 11:01:04 +0000
#Do not edit this file. Modify the relevant config and regenerate

require 'digest'

class PerlClibs < Formula
  url 'file://'+File.expand_path(__FILE__)
  desc 'Dependencies for the PerlClibs formula'
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  version '3'

  depends_on 'ensembl/ensembl/mysql-client'
  depends_on 'ensembl/ensembl/kent'
  depends_on 'ensembl/ensembl/htslib'
  depends_on 'ensembl/ensembl/postgres-client'

  def install
    File.open('perl-clibs', 'w') { |file|
      file.write '#!/bin/sh'+"\n"
      deps.each do | dep |
        f = dep.to_formula
        file.write "echo "+[f.full_name, f.version, f.prefix].join("\t")+"\n"
      end
    }
    bin.install 'perl-clibs'
  end
end
    