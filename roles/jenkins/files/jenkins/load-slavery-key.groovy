import jenkins.model.*
import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.common.*
import com.cloudbees.plugins.credentials.domains.*
import com.cloudbees.jenkins.plugins.sshcredentials.impl.*
import hudson.plugins.sshslaves.*;

global_domain = Domain.global()
credentials_store =
        Jenkins.instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()

credentials = new BasicSSHUserPrivateKey(
        CredentialsScope.GLOBAL,
        null,
        "jenkins",
        new BasicSSHUserPrivateKey.FileOnMasterPrivateKeySource("/ssh-keys/slavery-id_rsa"),
        "",
        "Key to manage the slaves"
)

//Check if the key has already been loaded
def creds = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials(
        com.cloudbees.plugins.credentials.common.StandardUsernameCredentials.class,
        Jenkins.instance,
        null,
        null
);

 boolean found = false
for (c in creds) {
    println(c.id + ": " + c.description)
    if(c.description.equals("Key to manage the slaves")) {
        found = true
        println("Key already loaded, skipping.")
    }
}

if(!found) {
    println("Loading SSH key")
    credentials_store.addCredentials(global_domain, credentials)
}