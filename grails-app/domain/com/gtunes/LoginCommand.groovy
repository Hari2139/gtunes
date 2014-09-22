package com.gtunes

class LoginCommand {
	String login
	String password
	private u

	MyUser getUser() {
		if(!u && login) {
			u = MyUser.findByLogin(login, [fetch:[purchasedSongs:'join']])
		}
		return u
	}

	static constraints = {
		login blank:false, validator: {val, cmd ->
			if(!cmd.user) {
				return 'user.not.found'
			}
		}
		password blank:false , validator:{val, cmd ->
			if(cmd.user && cmd.user.password != val) {
				return 'user.password.invalid'
			}
		}
	}
}
