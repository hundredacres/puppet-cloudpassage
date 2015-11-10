class cloudpassage {

  # if you have your own apt/yum module you can comment these out
  # I recommends puppetlabs-apt for apt
  case $::operatingsystem {
    /(?i:debian|ubuntu)/:        { include cloudpassage::apt }
    /(?i:redhat|centos|fedora|amazon)/: { include cloudpassage::yum }
    default: {}
  }

  include cloudpassage::params, cloudpassage::data
  include cloudpassage::install, cloudpassage::configure, cloudpassage::service

  Class['cloudpassage::install'] ~> Class['cloudpassage::configure'] ~> Class['cloudpassage::service']

}
