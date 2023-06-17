{ stdenv
, lib
, fetchzip
}:
let
    name = "Lakeside";
in
stdenv.mkDerivation rec {
  pname = "lakeside-2-wallpaper";
  version = "2.1";
  src = fetchzip {
    url = "https://cdn.manishk.dev/${name}.zip";
    sha256 = "sha256-DSG4oGOJDXFKatCL43bO93++y4pxg1Ygxt9kC3v+HvM=";
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
    description = "Lakeside GNOME dynamic wallpaper.";
    homepage = "https://github.com/manishprivet/dynamic-gnome-wallpapers";
    license = with licenses; [ unfree ];
    platforms = platforms.linux;
    maintainers = with maintainers; [ pcs3rd ];
  };
}