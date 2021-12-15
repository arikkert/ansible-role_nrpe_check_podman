Role Name
=========

Nagios NRPE for checking running podman pods and containers

Requirements
------------

NRPE is already installed
python3 (for the check script)

Role Variables
--------------

hostvars:

- pods: list of pods that should run on target host
- containers: list of containers that should run on target host

e.g. these can be the hostvars for *podman01*

    pods:
    - testpod01
    - testpod02

    containers:
    - hello_world
    - pihole
    - guacamole

Dependencies
------------

*role_nrpe* to install/configure NRPE

Example Playbook
----------------

the 2 vars containers and pods are optional and can be defined as host_vars.  
Note that the role is only useful as at least one of these vars is defined.  

    - hosts: podman01
      roles:
        - role: role_nrpe
          when: containers is defined or pods is defined
        - role: role_nrpe_check_podman
          when: containers is defined or pods is defined

Note
-------

This role configures user nrpe to run check_podman with elevated priveges

License
-------

BSD

Author Information
------------------

    ARK-ICT
    Andre Rikkert de Koe - ICT
