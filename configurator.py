print("This will create initial and basic server.cfg file! You may not use it if you don't want, but you can. At least server.cfg should exist in the module directory.")
hostname = input("Server name: ")
rconpass = input("Remote console password: ")
sv_contact = input("Server sv_contact: ")
mp_timelimit = input("Time limit on maps: ")
filename = "server.cfg"

f = open(filename, 'w')

file_base = '''
hostname "{hostname}"
rcon_password "{rconpass}"
sv_contact "{sv_contact}"
mp_timelimit "{mp_timelimit}"
'''.format(hostname=hostname, rconpass=rconpass, sv_contact=sv_contact, mp_timelimit=mp_timelimit)

f.write(file_base)
f.close()