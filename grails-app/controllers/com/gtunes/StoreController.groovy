package com.gtunes



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional
class StoreController {

	static allowedMethods = []

	def index() {
	}

	def shop() {
		/*def url = "http://itunes.apple.com/search?media=music&entity=album&attribute=albumTerm&term=mtv+unplugged"
		 def response = rest.get(url)
		 def json = response.json
		 println "# of results = " + json.resultCount
		 println json.results*.artistName
		 def records = json.results
		 def matchingRecord = records.find {
		 //it.artistName == 'Katy Perry' &&
		 it.collectionName == 'MTV Unplugged'
		 }
		 def albumArt = matchingRecord?.artworkUrl100  ?: DEFAULT_ALBUM_ART_IMAGE*/
		[top5Songs: Song.withCriteria({maxResults 5}), top5Albums: Album.withCriteria({maxResults 5})]
	}
}
