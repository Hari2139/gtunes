import com.gtunes.AlbumArtService
import com.gtunes.LoginCommand
// Place your Spring DSL code here
beans = {
	loginCmd(LoginCommand) //restBuilder(grails.plugins.rest.client.RestBuilder, [:])
	albumArtService(AlbumArtService)
}
