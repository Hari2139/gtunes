package com.gtunes



class AlbumArtTagLib {
	//static defaultEncodeAs = [taglib:'html']
	//static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	static namespace = "music"
	def albumArtService

	def albumArt = { attributes, body ->
		def artistName = attributes.get('artist')?.toString()
		def albumTitle = attributes.get('album')?.toString()
		def width = attributes.int('width', 100)
		attributes.remove('width')
		def albumArt = albumArtService.getAlbumArt(artistName, albumTitle)
		if(albumArt.startsWith("/")) albumArt = "${request.contextPath}${albumArt}"

		out << "<img width=\"$width\" src=\"${albumArt}\" "
		out << attributes.collect { name, value -> " ${name}=\"${value.encodeAsHTML()}\"" }.join(' ')
		out << " />"
	}
}
