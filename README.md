Role Name
=========

Nagios NRPE for checking running podman pods and containers

Galaxy : yes

Requirements
------------

NRPE is already installed  
python3 (for the check script)

Role Variables
--------------

vars:

- *pods*: list of pods that should run on target host
- *containers*: list of containers that should run on target host

e.g. these can be the hostvars for host *podman01*

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
Note that the role is only useful if at least one of these vars is defined.  
Else there will be nothing to check.  
*arikkert.nrpe_check_podman* will install *arikkert.role_nrpe* as dependency

    - hosts: podman01
      roles:
        - role: arikkert.nrpe_check_podman
          when: containers is defined or pods is defined

Example of script that uses this role : https://github.com/arikkert/ansible-podmanhost

Note
-------

This role configures user *nrpe* to run *check_podman* with elevated privileges

License
-------

BSD

Author Information
------------------

    ARK-ICT
    Andre Rikkert de Koe - ICT
