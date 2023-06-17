{ stdenv
, lib
, fetchzip
}:
let
    name = "Firewatch";
in
stdenv.mkDerivation rec {
  pname = "firewatch-wallpaper";
  version = "2.1";
  src = fetchzip {
    url = "https://cdn.manishk.dev/Firewatch.zip";
    sha256 = "sha256-GKbcn9pVfWdeC5Iw/BEhZt6NpTNjfWYzpV+Cvq5FD6o=";
    stripRoot = false;
  };
  postPatch = ''
    substituteInPlace ${name}-timed.xml \
      --replace /usr/share/backgrounds/gnome/${name}-timed/ $out/share/backgrounds/animated/${name}/
    substituteInPlace ${name}.xml \
      --replace /usr/share/backgrounds/gnome/${name}-timed.xml $out/share/gnome-background-properties/${name}.xml
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/backgrounds/animated/${name}
    mkdir -p $out/share/gnome-background-properties/
    mv *.jpg $out/share/backgrounds/animated/${name}
    mv ${name}-timed.xml $out/share/backgrounds/animated/${name}.xml
    mv ${name}.xml $out/share/gnome-background-properties/${name}.xml
    runHook postInstall
  '';

  meta = with lib; {
    description = "Firewatch GNOME dynamic wallpaper";
    homepage = "https://github.com/manishprivet/dynamic-gnome-wallpapers";
    license = with licenses; [ unfree ];
    platforms = platforms.linux;
    maintainers = with maintainers; [ pcs3rd ];
  };
}