package com.mere.utils.datagramserver.application
{
	import com.mere.utils.datagramserver.domain.DatagramModel;
	import com.mere.utils.datagramserver.infrastructure.DatagramServer;
	
	import flash.events.Event;
	import flash.net.InterfaceAddress;
	import flash.net.NetworkInfo;
	import flash.net.NetworkInterface;

	public final class DatagramServerInitCommand
	{
		
		[Inject]
		public var model:DatagramModel;
		
		[Inject]
		public var socket:DatagramServer;
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Init]
		public function init():void
		{
			model.host = '';
			model.port = ''
			retrieveNetworkInterfaces();
		}
		
		
		private function retrieveNetworkInterfaces():void
		{
			var results:Vector.<NetworkInterface> = NetworkInfo.networkInfo.findInterfaces(); 
			
			for each (var iface:NetworkInterface in results)
			{
				for each (var address:InterfaceAddress in iface.addresses)
				{
					if (iface.active && !model.host)
						model.host = address.address;
					model.hostsAvailable.addItem(address.address);
				}
			}
			
		}
	}
}