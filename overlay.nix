{ inputs, self }:
final: prev:
let inherit (final) lib;
in
rec {
  flask-basicauth = final.callPackage ./pkgs/flask-basicauth.nix { inherit (final.python3Packages) buildPythonPackage fetchPypi flask; };
  roundrobin = final.callPackage ./pkgs/round-robin.nix { inherit (final.python3Packages) buildPythonPackage fetchPypi; };

  locust = final.python3Packages.buildPythonPackage rec {
    pname = "locust";
    version = "2.8.3";

    src = inputs.locust;

    SETUPTOOLS_SCM_PRETEND_VERSION = "v${version}";
    doCheck = false;

    nativeBuildInputs = with final.python3Packages; [
      setuptools-scm
    ];

    propagatedBuildInputs = with final.python3Packages; [
      coverage
      gevent
      flask-cors
      configargparse
      pyzmq
      requests
      msgpack
      final.flask-basicauth
      geventhttpclient
      final.roundrobin
      psutil
      flask
    ];

    meta = {
      homepage = "https://locust.io/";
      description = "A load testing tool";
    };
  };
}
