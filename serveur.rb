gem 'soap4r-ruby1.9'
gem 'logger-application'

require 'logger'
require 'logger-application'
require 'soap/rpc/standaloneServer'

class MonServeur < SOAP::RPC::StandaloneServer
	def on_init
		add_method(self,'add','a','b')
	end

	def add(a,b)
		return a+b		
	end
end
	serveur = MonServeur.new('serveurD','urn:ruby:calculation','localhost',8089)

	serveur.start
