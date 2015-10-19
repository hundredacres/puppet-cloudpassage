class cloudpassage::configure {

  exec { 'cloudpassage configure before first start':
    command     => "/opt/cloudpassage/bin/configure --agent-key=${cloudpassage::data::agentkey} --tag=${cloudpassage::data::tags} --dns=${cloudpassage::data::dns} --readonly=${cloudpassage::data::readonly}",
    path        => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
    logoutput   => on_failure,
    refreshonly => true,
  }

}
