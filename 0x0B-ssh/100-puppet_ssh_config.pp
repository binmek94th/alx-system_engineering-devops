# This puppet file make changes to our configuration file
file { '/home/ubuntu/.ssh/config':
  ensure  => present,
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode    => '0600',
}

file_line { 'Declare identity file':
  path  => '/home/ubuntu/.ssh/config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^(\s*)IdentityFile',
}

file_line { 'Turn off passwd auth':
  path  => '/home/ubuntu/.ssh/config',
  line  => '    PasswordAuthentication no',
  match => '^(\s*)PasswordAuthentication',
}

file_line { 'Declare Host wildcard':
  path  => '/home/ubuntu/.ssh/config',
  line  => 'Host *',
  match => '^Host \*',
}
