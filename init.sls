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

steamcmd_package_download_n_extract:
  archive.extracted:
    - name: /home/gameserver/hlserver
    - source: https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
    - skip_verify: True
    - user: gameserver
    - group: gameserver
    - enforce_toplevel: False
    - extract_perms: False

#Reason: archive.extracted did not seem to respect folder ownerships
fix_steamcmd_packge_permissions:
  cmd.run:
    - name: chown -R gameserver:gameserver /home/gameserver/hlserver


#Runs only if assumes the initial setup has been done...
install_n_download_tf2_server_files:
  cmd.run:
    - runas: gameserver
    - cwd: /home/gameserver/hlserver
    - name: /home/gameserver/hlserver/steamcmd.sh +login anonymous +force_install_dir ./tf2 +app_update 232250 +quit
    - creates:
      - /home/gameserver/hlserver/tf2/tf/gameinfo.txt

#See tf2.sh, required by -autoupdate parameter
server_updating_script_config:
  file.managed:
    - user: gameserver
    - name: /home/gameserver/hlserver/tf2_ds.txt
    - source: salt://tf2salt/tf2_ds.txt
    - makedirs: True

server_basic_config:
  file.managed:
    - user: gameserver
    - name: /home/gameserver/hlserver/tf2/tf/cfg/server.cfg
    - source: salt://tf2salt/server.cfg
    - makedirs: True

tf2_executer_script:
  file.managed:
    - user: gameserver
    - mode: 0764
    - name: /home/gameserver/hlserver/tf2.sh
    - source: salt://tf2salt/tf2.sh

#SteamSDK32BIT symlink fix
/home/gameserver/.steam/sdk32:
  file.symlink:
    - target: /home/gameserver/hlserver/tf2/bin
    - user: gameserver

#LIBCURL symlink fix
/usr/lib/libcurl-gnutls.so.4:
  file.symlink:
  - target: /usr/lib/libcurl.so.4

tf2_systemd_service:
  file.managed:
    - name: /etc/systemd/system/tf2server.service
    - source: salt://tf2salt/tf2server.service

systemd-reload:
  cmd.run:
   - name: systemctl --system daemon-reload
   - onchanges:  
     - file: tf2_systemd_service