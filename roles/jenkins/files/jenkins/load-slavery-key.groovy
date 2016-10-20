import jenkins.model.*
import hudson.model.*
import hudson.slaves.*
import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.common.*
import com.cloudbees.plugins.credentials.domains.*
import com.cloudbees.jenkins.plugins.sshcredentials.impl.*
import hudson.plugins.sshslaves.*;
import hudson.slaves.EnvironmentVariablesNodeProperty.Entry;

global_domain = Domain.global()
credentials_store =
        Jenkins.instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()


credentials = new BasicSSHUserPrivateKey(
        CredentialsScope.GLOBAL,        //scope
        "slaveKey-01",                  //id
        "jenkins",                      //Usernae
        new BasicSSHUserPrivateKey.FileOnMasterPrivateKeySource("/ssh-keys/slavery-id_rsa"),   //PrivateKeySource
        "",                             //passphrase
        "Key to manage the slaves"      //description
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

//---------------------------------------------------
//Setup the agent using the above registered ssh key

List<Entry> env = new ArrayList<Entry>();
env.add(new Entry("key1","value1"))
env.add(new Entry("key2","value2"))
EnvironmentVariablesNodeProperty envPro = new EnvironmentVariablesNodeProperty(env);
Slave slave = new DumbSlave(
        "agent-node","Agent node description",
        "/home/jenkins",
        "2",
        Node.Mode.NORMAL,
        "agent-node-label",
        new SSHLauncher("ssh-agent",22, "slaveKey-01" ,"","/usr/bin/java", "", "", 15, 3, 5),
        new RetentionStrategy.Always(),
        new LinkedList())
slave.getNodeProperties().add(envPro)
Jenkins.instance.addNode(slave)

println("Added successfully \"agent node\" to Jenkins ")
