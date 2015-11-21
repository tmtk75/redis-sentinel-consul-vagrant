class consul {
  include install
}

class consul::install {
  exec { "download bin":
    command => "/usr/bin/curl -OL https://releases.hashicorp.com/consul/0.5.2/consul_0.5.2_linux_amd64.zip",
    cwd     => "/tmp",
    creates => "/tmp/consul_0.5.2_linux_amd64.zip",
  }

  -> exec { "unzip": 
    command => "/usr/bin/unzip consul_0.5.2_linux_amd64.zip",
    cwd     => "/tmp",
    creates => "/tmp/consul",
  }

  -> exec { "cp": 
    command => "/bin/cp /tmp/consul /usr/local/sbin/consul",
    creates => "/usr/local/sbin/consul",
  }
}
