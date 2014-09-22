package com.gtunes

import grails.transaction.Transactional

@Transactional
class StoreService {
	//Use Spring's transaction management
	static transactional = true

	//All the methods will be exposed via JMX.
	//However, to enable remote access, the application should be started with
	//-Dcom.sun.management.jmxremote
	static expose = ['jmx']

	def getAlbumCount() {
		Album.count()
	}
}
