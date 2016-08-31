import jenkins.model.*
import hudson.model.*
import hudson.slaves.*
import hudson.plugins.sshslaves.*
import java.util.ArrayList;
import hudson.slaves.EnvironmentVariablesNodeProperty.Entry;

List<Entry> env = new ArrayList<Entry>();
env.add(new Entry("key1","value1"))
env.add(new Entry("key2","value2"))
EnvironmentVariablesNodeProperty envPro = new EnvironmentVariablesNodeProperty(env);
Slave slave = new DumbSlave(
        "agent-node","Agent node description",
        "/home/jenkins",
        "1",
        Node.Mode.NORMAL,
        "agent-node-label",
        new SSHLauncher("agenNode",22,"user","password","","","","",""),
        new RetentionStrategy.Always(),
        new LinkedList())
slave.getNodeProperties().add(envPro)
Jenkins.instance.addNode(slave)

//SSHlaucher
//https://raw.githubusercontent.com/jenkinsci/ssh-slaves-plugin/ae2d6dee1a03a155c991809a4fcac11c5537bdd9/src/main/java/hudson/plugins/sshslaves/SSHLauncher.java

//Dumbslave
//https://raw.githubusercontent.com/jenkinsci/jenkins/31ad77005ea1cb9ab07e2312b6dadd1eb15ab72b/core/src/main/java/hudson/slaves/DumbSlave.java

//example of a SSHlauncher
//https://raw.githubusercontent.com/jenkinsci/jclouds-plugin/6d99045db7f718c290730a2e3798b88b8feb2413/jclouds-plugin/src/main/java/jenkins/plugins/jclouds/compute/JCloudsLauncher.java
