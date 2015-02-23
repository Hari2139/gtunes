package com.gtunes

import grails.plugin.cache.Cacheable
import grails.plugins.rest.client.RestBuilder
import grails.transaction.Transactional

@Transactional
class AlbumArtService {
	//When the transactional property is set to true, the methods of the service
	//are configured for transaction demarcation by Spring.
	//What this does is create a Spring proxy that wraps each method call
	//and provides transaction management
	static transactional = false
	static final DEFAULT_ALBUM_ART_IMAGE = "/assets/default.jpg"

	@Cacheable("albumArt") //Name of the cache is optional
	def getAlbumArt(String artistName, String albumTitle) {
		log.debug "Getting artwork for artist ${artistName} in album ${albumTitle} ..."
		def albumArt = DEFAULT_ALBUM_ART_IMAGE
		if(artistName && albumTitle) {
			try{
				//Remember to encode as URL
				def url = "http://itunes.apple.com/search?media=music&entity=album&attribute=albumTerm&term=${albumTitle.encodeAsURL()}"
				def response = new RestBuilder().get(url)
				def json = response.json
				def records = json.results
				log.debug records.collect {it.artistName}
				//find the record that has the correct artist name
				def matchingRecord = records.find { //it.artistName == artistName &&
					it.collectionName == albumTitle }
				albumArt = matchingRecord?.artworkUrl100 ?: DEFAULT_ALBUM_ART_IMAGE
			} catch (Exception e) {
				e.printStackTrace()
				log.error "Failed to retrieve album art: ${e.message}", e
			}
		}
		albumArt
	}
}
