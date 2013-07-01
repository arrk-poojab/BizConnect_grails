import twitter4j.*
import twitter4j.Twitter
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import twitter4j.auth.RequestToken
import twitter4j.TwitterFactory
import twitter4j.auth.AccessToken
import twitter4j.TwitterException
import javax.servlet.http.HttpServletResponse
import twitter4j.Status
//import org.codehaus.groovy.grails.plugins.springsecurity.Secured
import org.twitter4j.grails.plugin.*


class TwitterController {

	def twitterResponse
	Twitter4jService twitter4jService
	def beforeInterceptor = {
		if(ConfigurationHolder.config.twitter.disableTwitter4jController) {
			log.debug("Twitter4jController is disabled")
			response.sendError HttpServletResponse.SC_NOT_FOUND
			return false
		}
		return true
	}
	
	def index = {
		println "--here---"
		twitter4jService.connect()
		try {
			def result = twitter4jService.getUserTimeline() // of type ResponseList<Status>
		    println(result)
		
			def json = new groovy.json.JsonBuilder()
			println "---"
			def result1 = json {
				 response result
			}
			println json
			println "---------------------------------------------------------------------------------"
			//println result1
			println json.toPrettyString()
			render json
			
		} catch (TwitterException te) {
			flash.error = te.message
		}
	//render(view: "tweets", model: [result:result])
	//	render(view: "home")
		
	}

}
	

	
