# This puppet file make changes to our configuration file
file_line { 'Declare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^\s*IdentityFile',
}

file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',
  line  => '    PasswordAuthentication no',
  match => '^\s*PasswordAuthentication',
}

file_line { 'Ensure Host wildcard exists':
  path  => '/etc/ssh/ssh_config',
  line  => 'Host *',
  match => '^Host \*',
}
