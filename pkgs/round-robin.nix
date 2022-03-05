{ lib, fetchPypi, buildPythonPackage }:

buildPythonPackage rec {
  pname = "roundrobin";
  version = "0.0.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-rDDLeFcKNrsM4Nt7kHr5OU7HpWEOzi7eByKA6N2GfKo=";
  };

  propagatedBuildInputs = [ ];

  doCheck = false;

  meta = with lib; {
    description = "This is rather small collection of round robin utilites";
    homepage = "https://github.com/linnik/roundrobin";
    license = with licenses; [ mit ];
  };
}
