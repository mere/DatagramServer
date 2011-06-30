<h1>Flex DatagramServer</h1>

DatagramServer is small library for Flex+Parsley that allows you to set up and manage a UDP listener in your Air 2.5+ application.
<a href="http://zoltanb.co.uk/flex-datagram-server/" >http://zoltanb.co.uk/flex-datagram-server/</a>
<h2>Dependencies</h2>
<ul>
<li>integration-0.15.swc</li>
<li>integrationParsley-0.15.swc</li>
<li>observer-1.13.swc</li>
<li>parsley-flex4-2.4.M2.swc</li>
<li>spicelib-flex-2.4.M2.swc</li>
</ul>

<h2>Setup</h2>
<ol>
	<li>In your Parsley contextbuilder register DatagramServerContext:

<br /><code>&lt;parsley:FlexConfig type="{ DatagramServerContext }"/&gt;</code></li>
	<li>If you want to edit the datagram host and port from the UI, fastinject DatagramModel, then create a two way binding to .host and .port:
<br /><code>&lt;s:TextInput text="@{data.host}" width="120" /&gt;
&lt;s:TextInput text="@{data.port}" width="40" /&gt;</code></li>
	<li>Start/Stop the Datagram server from any parsley-managed class, eg.::
<br /><code>dispatcher(new Event(DatagramServerEvent.START));
dispatcher(new Event(DatagramServerEvent.STOP));</code></li>
	<li>To listen to incoming UDP packages, create a parsley messagehandler:
<br /><code>[MessageHandler]
public function dataReceived(e:DataReceivedEvent):void
{
logs.add(e.string);
/**
* you can also use:
* e.ip     : returns the IP of the sender
* e.data     : returns the packet as a bytearray
* e.xml     : returns the packet as xml
*/
}</code></li>
</ol>