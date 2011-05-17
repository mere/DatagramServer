package com.mere.utils.datagramserver.infrastructure
{
	import com.mere.utils.datagramserver.events.DataReceivedEvent;
	
	import flash.events.DatagramSocketDataEvent;
	import flash.events.Event;
	import flash.net.DatagramSocket;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	
	import org.spicefactory.lib.logging.LogContext;
	import org.spicefactory.lib.logging.Logger;
	
	public final class UIDatagramServer
	{
		private static const log : Logger = LogContext.getLogger(UIDatagramServer);

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
			log.info('[DatagramServer] closing connection.');
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
				socket.bind(port);//localAddress);
				log.info('[DatagramServer] listening on '+localAddress+':'+port);
			}
			catch (error:Error)
			{
				log.error( "[DatagramServer] error:"+error);
			}
		}
		
		private function onData(e: DatagramSocketDataEvent):void 
		{
			var byteArray:ByteArray = ByteArray(e.data);
			byteArray.uncompress();
			dispatcher(new DataReceivedEvent(e.srcAddress,byteArray));
		}
	}
}