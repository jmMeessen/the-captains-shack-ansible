import jenkins.model.*;
import hudson.model.*;
import hudson.slaves.*;
import com.cloudbees.plugins.credentials.*;
import com.cloudbees.plugins.credentials.common.*;
import com.cloudbees.plugins.credentials.impl.*;
import com.cloudbees.plugins.credentials.domains.*;
import hudson.slaves.EnvironmentVariablesNodeProperty.Entry;

global_domain = Domain.global()
credentials_store =
        Jenkins.instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()

def env = System.getenv()
String githubToken = env['GH_ACCESS_TOKEN']

//Check if the token has already been loaded
def creds = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials(
        com.cloudbees.plugins.credentials.common.StandardUsernameCredentials.class,
        Jenkins.instance,
        null,
        null
);

boolean found = false
for (c in creds) {
    println(c.id + ": " + c.description)
    if(c.description.equals("Token to connect to Github")) {
        found = true
        println("Token already loaded, skipping.")
    }
}

if(!found) {
    Credentials credentials = 
                    (Credentials) new UsernamePasswordCredentialsImpl(
                            CredentialsScope.GLOBAL,
                            "GithubToken", 
                            "Token to connect to Github", 
                            "jmMeessen", 
                            githubToken)
    
    println("Loading Github token")
    credentials_store.addCredentials(global_domain, credentials)
}





