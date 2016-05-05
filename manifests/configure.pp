class cloudpassage::configure {

  exec { 'cloudpassage configure before first start':
    command     => "/opt/cloudpassage/bin/configure --agent-key=${cloudpassage::params::agentkey} --tag=${cloudpassage::params::tags} --dns=${cloudpassage::params::dns} --readonly=${cloudpassage::params::readonly}",
    path        => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
    logoutput   => on_failure,
    refreshonly => true,
  }

}
