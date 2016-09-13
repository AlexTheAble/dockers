# dockers

Command for running in interactive mode
docker docker run --tty --interactive --volume=$(pwd):/opt/workspace --dns=\<ip of DNS server\> --dns-search=\<URL for nameserver\> alexanderheavner/android /bin/bash

Comand for running command
docker docker run --interactive --volume=$(pwd):/opt/workspace --dns=\<ip of DNS server\> --dns-search=\<URL for nameserver\> alexanderheavner/android /bin/bash -c "\<command\>"
