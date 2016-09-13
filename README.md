# dockers

<h2>Command for running in interactive mode</h2>
docker docker run --tty --interactive --volume=$(pwd):/opt/workspace --dns=<i>\<ip of DNS server\></i> --dns-search=<i>\<URL for nameserver\></i> alexanderheavner/android /bin/bash

<h2>Comand for running command</h2>
docker docker run --interactive --volume=$(pwd):/opt/workspace --dns=<i>\<ip of DNS server\></i> --dns-search=<i>\<URL for nameserver\></i> alexanderheavner/android /bin/bash -c "<i>\<command\></i>"
