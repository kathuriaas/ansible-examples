# Example-01

This example demonstrates use of environment variables, to prevent logging of sensitive information during ansible verbose/debug mode (upto -vv). In a playbook, if we add environment keyword, that will set environment variable on target node and can be used in scripts.

## How to use:-

Create .env_setup file parallel to .env_setup_template (can copy the template) and add required variables.

Create a file inv.txt with below contents

```shell
ssh_server
ssh_server2
```

Now, run below command (you may pass list of servers, which are also in inventory file i.e. inv.txt here):-

```shell
<script path>/run_playbook-01.sh ssh_server,ssh_server2 inv.txt
```
