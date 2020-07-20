# Capa Dockerfile

Fireeye has published CAPA (https://github.com/fireeye/capa), this is just a minimal dockerfile to build and run.

# Build
```
cd capa-dockerfile
docker build -t capa .
```

# Running
Using a shared volume
```
podman run -it --rm -v <path of local dir>:/tmp capa /tmp/calc.exe
```

Will show the following
```
45 functions [00:00, 77.49 functions/s]
+------------------------+------------------------------------------------------------------------------------+
| md5                    | d34b200ebf6b4d0596ac148e09b0dc21                                                   |
| path                   | /tmp/calc.exe                                                                      |
+------------------------+------------------------------------------------------------------------------------+

+------------------------+------------------------------------------------------------------------------------+
| ATT&CK Tactic          | ATT&CK Technique                                                                   |
|------------------------+------------------------------------------------------------------------------------|
| EXECUTION              | Shared Modules [T1129]                                                             |
+------------------------+------------------------------------------------------------------------------------+

+------------------------------------------------------+------------------------------------------------------+
| CAPABILITY                                           | NAMESPACE                                            |
|------------------------------------------------------+------------------------------------------------------|
| check for time delay via GetTickCount                | anti-analysis/anti-debugging/debugger-detection      |
| contain a resource (.rsrc) section                   | executable/pe/section/rsrc                           |
| create process                                       | host-interaction/process/create                      |
| terminate process (3 matches)                        | host-interaction/process/terminate                   |
| parse PE header (3 matches)                          | load-code/pe                                         |
+------------------------------------------------------+------------------------------------------------------+
```

Under Fedora (or system with SELinux)
```
podman run -it --rm --security-opt label=disable -v <path of local dir>:/tmp capa /tmp/calc.exe
```
