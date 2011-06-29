package com.mere.utils.datagramserver.infrastructure
{
	import com.mere.utils.datagramserver.domain.enum.DatagramStatusEnum;
	import com.mere.utils.datagramserver.events.DataReceivedEvent;
	import com.mere.utils.datagramserver.events.DatagramStatusEvent;
	
	import flash.events.DatagramSocketDataEvent;
	import flash.net.DatagramSocket;
	import flash.utils.ByteArray;
	
	import org.spicefactory.lib.logging.LogContext;
	import org.spicefactory.lib.logging.Logger;
	
	public final class DatagramServer
	{
		private static const log : Logger = LogContext.getLogger(DatagramServer);
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		private var socket:DatagramSocket;
		
		/**
		 * 	Start listening for UDP packets
		 */ 
		public function start(port:int,localAddress:String):void
		{
			if (!socket)
				setupSocketServer(port,localAddress);
			
			if (socket) // setupSocketServer can fail if the port is invalid
				socket.receive();
		}
		
		/**
		 * 	Stop listening for incoming packets
		 */ 
		public function stop():void
		{
			dispatcher(new DatagramStatusEvent(DatagramStatusEnum.DISCONNECTED, "[DatagramServer] Connection closed."));
			if (socket && socket.bound)
				socket.close();
			socket = null;
		}
			
		private function setupSocketServer(port:int,localAddress:String):void
		{
			try
			{
				socket = new DatagramSocket();
				socket.addEventListener( DatagramSocketDataEvent.DATA, onData );
				socket.bind(port, localAddress);
				dispatcher(new DatagramStatusEvent(DatagramStatusEnum.CONNECTED, '[DatagramServer] listening on '+localAddress+':'+port));
			}
			catch (error:Error)
			{
				dispatcher(new DatagramStatusEvent(DatagramStatusEnum.FAILED, "[DatagramServer] error:"+error));
			}
		}
		
		private function onData(e: DatagramSocketDataEvent):void 
		{
			var byteArray:ByteArray = ByteArray(e.data);
			try
			{
				byteArray.uncompress();
			}
			catch(e:Error)
			{
				//the datagram packet wasn't compressed.
			}
			
			log.info('[DatagramServer] Data received: '+byteArray);
			dispatcher(new DataReceivedEvent(e.srcAddress,byteArray));
		}
	}
}