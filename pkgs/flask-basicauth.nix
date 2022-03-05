{ lib, fetchPypi, buildPythonPackage, flask }:

buildPythonPackage rec {
  pname = "Flask-BasicAuth";
  version = "0.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-3169SJ3AkUwiRBnaBZ2ZHrcpiKAc3UuVbVKTLOfVAf8=";
  };

  propagatedBuildInputs = [ flask ];

  doCheck = false;

  meta = with lib; {
    description = "HTTP basic access authentication for Flask.";
    homepage = "https://github.com/jpvanhal/flask-basicauth";
    license = with licenses; [ free ];
  };
}
