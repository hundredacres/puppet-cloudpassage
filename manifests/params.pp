class cloudpassage::params {
  $apikey = '11111111111111111111111111111111111'
  $agentkey = '22222222222222222222222222222222222'
  $repokey = '33333333333333333333333333333333333'
  $tags = $::operatingsystem
  $dns = true
  $readonly = false
  $manage_repo = true
  $service_ensure = 'running'
  $service_enable = true

  # (Modify only to adapt to unsupported OSes)
  $packagename = $::operatingsystem ? {
    default => 'cphalo',
  }

  $servicename = $::operatingsystem ? {
    default => 'cphalod',
  }

  $processname = $::operatingsystem ? {
    default => 'cphalo',
  }

  $hasstatus = $::operatingsystem ? {
    /(?i:debian|ubuntu)/        => false,
    /(?i:redhat|centos|fedora|amazon)/ => true,
  }

  $configfile = $::operatingsystem ? {
    default => '/etc/cphalo/cphalo.conf',
  }

  $configdir = $::operatingsystem ? {
    default => '/etc/cphalo',
  }

}
