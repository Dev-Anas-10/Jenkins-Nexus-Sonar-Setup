#!/bin/bash

# Reading the join command from the file
JOIN_COMMAND=$(cat /home/vagrant/join_command.txt)

# Execute the join command to join the worker node to the cluster
$JOIN_COMMAND
