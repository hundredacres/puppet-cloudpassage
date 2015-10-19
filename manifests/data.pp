class cloudpassage::data {

  # using extlookup here allows per server, env, or hostgroup settings
  # switch to hiera once it goes into Puppet core
  $apikey = extlookup('cloudpassage_apikey','11111111111111111111111111111111111')
  $agentkey = extlookup('cloudpassage_agentkey','22222222222222222222222222222222222')
  $repokey = extlookup('cloudpassage_repokey','33333333333333333333333333333333333')
  $tags = extlookup('cloudpassage_tags',"$::operatingsystem")
  $dns = extlookup('cloudpassage_dns',"true")
  $readonly = extlookup('cloudpassage_readonly',"false")

}
