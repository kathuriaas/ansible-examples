# Example-01

## How to use:-

Create a file inv.txt with below contents

```shell
ssh_server
ssh_server2
```

Now, run below command (you may pass list of servers, which are also in inventory file i.e. inv.txt here):-

```shell
<script path>/run_playbook-01.sh ssh_server,ssh_server2 inv.txt
```
