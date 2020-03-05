# Random adjective-animal hostname

Inspired by [jgnewman/randanimal](https://github.com/jgnewman/randanimal). Sets the hostname to `adjective-animal` with a possible prefix and FQDN.

# Outputs

No variable overrides:

`future-hedgehog.local`

Prefix override:

`sql-future-hedgehog.local`

Prefix and FQDN override:

`sql-future-hedgehog.acmecompany.com`

Example:

```yml
---
- hosts: all
  become: true
  vars:
    prefix: "sql"
    fqdn: "acmecompany.com"
  tasks:
    - include: tasks/main.yml
```