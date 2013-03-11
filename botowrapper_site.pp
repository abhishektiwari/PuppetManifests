# Goes to /etc/puppet/manifests/site.pp
node default {
	include python
	include python::pip
	include python::virtualenv
	class { 'python::myvirtualenv':
		app_name => "botoenv",
		req_file => "/vagrant/botowrapper/requirements.txt",
	}
	ubuntu::sshkey {"id_rsa_abhishekctn_key":
		keyname   => "id_rsa_abhishekctn",
	}
	ubuntu::sshkey {"id_rsa_abhishektiwari_key":
		keyname   => "id_rsa_abhishektiwari",
	}
	ubuntu::sshconfig {"config_me":
		configname  => "config",
	}
	ubuntu::sshkeypem {"key_asia":
		keyname  => "ctnasia_keypair.pem",
	}
	ubuntu::sshkeypem {"key_anz":
		keyname  => "ctnasiaanz_keypair.pem",
	}
	ubuntu::sshkeypem {"key_us":
		keyname  => "ctnus_keypair.pem",
	}
	ubuntu::sshkeypem {"key_fact":
		keyname  => "ctnfact_keypair.pem",
	}
}

# Set default path for Exec calls
Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/sbin/', '/usr/local/bin' ]
}