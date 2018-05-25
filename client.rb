require 'soap/rpc/driver'

calc = SOAP::RPC::Driver.new('http://localhost:8089','urn:ruby:calculation','serveurD')

calc.add_method('add','a','b')
puts calc.add(20,30)