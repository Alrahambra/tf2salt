dep_packages:
  pkg.installed:
    - pkgs:
      - gdb.x86_64
      - glibc.i686
      - libcurl-devel.i686
      - libcurl-devel.x86_64
      - libcurl.i686
      - libcurl.x86_64
      - libgcc.i686
      - libgcc.x86_64
      - libstdc++-devel
      - libstdc++-devel.i686
      - libstdc++.i686
      - libstdc++.x86_64
      - mailx.x86_64
      - nano.x86_64
      - ncompress.x86_64
      - ncurses-compat-libs.x86_64
      - ncurses-compat-libs.i686
      - ncurses-libs.i686
      - ncurses-libs.x86_64
      - wget.x86_64
      - zlib.i686

gameserver:
  user.present

/home/gameserver/:
  file.directory:
    - user: gameserver
    - name: /home/gameserver/hlserver

steamcmd_package_download:
  cmd.run:
    - name: wget -O /home/gameserver/hlserver/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
    - creates: /home/gameserver/hlserver/steamcmd_linux.tar.gz

    