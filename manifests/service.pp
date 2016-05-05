class cloudpassage::service {

  service { 'cphalo':
    ensure     => $cloudpassage::params::service_ensure,
    enable     => $cloudpassage::params::service_enable,
    hasrestart => true,
    hasstatus  => true,
    name       => $cloudpassage::params::servicename,
    start      => 'service cphalod start',
  }

}
