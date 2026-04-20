1. Generating a new SSH key

```sh
ssh-keygen -t ed25519 -C 'work@example.com' -f 'id_ed25519_work'
ssh-keygen -t ed25519 -C 'me@example.com'   -f 'id_ed25519_me'
```

2. Creating configuration files for each git account

`~/.config/git/configwork`

```ini
[user]
    name = Nam Nguyen
    email = work@example.com
[core]
    sshCommand = "ssh -i ~/.ssh/id_ed25519_work"
```

`~/.config/git/configme`

```ini
[user]
    name = Nam Nguyen
    email = me@example.com
[core]
    sshCommand = "ssh -i ~/.ssh/id_ed25519_me"
```

3. Including appropriate configuration files

`~/.config/git/config`

```ini
[includeIf "gitdir:~/workspace/work/"]
    path = ~/.config/git/configwork
[includeIf "gitdir:~/workspace/me/"]
    path = ~/.config/git/configme
```

4. Restarting machine
