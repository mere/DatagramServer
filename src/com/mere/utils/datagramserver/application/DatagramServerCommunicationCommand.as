package com.mere.utils.datagramserver.application
{
	import com.mere.utils.datagramserver.domain.DatagramModel;
	import com.mere.utils.datagramserver.events.DatagramStatusEvent;
	import com.mere.utils.datagramserver.infrastructure.DatagramServer;
	
	import flash.events.Event;
	

	public final class DatagramServerCommunicationCommand
	{
		
		[Inject]
		public var socket:DatagramServer;
		
		[Inject]
		public var model:DatagramModel;
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[MessageHandler(selector="START_DATAGRAM_SERVER")]
		public function start(e:Event):void
		{
			socket.start(int(model.port),model.host);
		}
		
		[MessageHandler(selector="STOP_DATAGRAM_SERVER")]
		public function stop(e:Event):void
		{
			socket.stop();
		}
		
		[MessageHandler]
		public function onStatusChanged(e:DatagramStatusEvent):void
		{
			model.status = e.status;
		}
		
		
	}
}