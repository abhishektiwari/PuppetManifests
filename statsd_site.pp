Exec {
  path => ["/usr/bin", "/usr/sbin", '/bin']
}

Exec["apt-get-update"] -> Package <| |>

exec { "apt-get-update" :
  command => "/usr/bin/apt-get update",
}

class { 'statsd':
	ghost => "192.168.1.10",
}

