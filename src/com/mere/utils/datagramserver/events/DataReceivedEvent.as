package com.mere.utils.datagramserver.events
{
	import flash.utils.ByteArray;
	
	import org.spicefactory.lib.task.util.XmlLoaderTask;

	public final class DataReceivedEvent
	{
		private var _ip:String;
		private var _data:ByteArray;
		
		/**
		 * 	Dispatched when the datagram server receives a datagram packet.
		 *  @param ip the IP of the sender
		 *  @param data the data sent in the datagram
		 */ 
		public function DataReceivedEvent(ip:String, data:ByteArray)
		{
			_ip = ip;
			_data = data;
		}
		
		/**
		 * 	@return the data received as ByteArray
		 */ 
		public function get data():ByteArray
		{
			return _data;
		}
		
		/**
		 * 	@return the data received as String
		 */ 
		public function get string():String
		{
			_data.position=0;
			var length:uint = _data.bytesAvailable;
			var contents:String = _data.readUTFBytes( length);
			return contents;
		}
		
		/**
		 * 	@return the data received as XML
		 */
		public function get xml():XML
		{
			return XML(string);
		}

		/**
		 * 	@return the IP address of the datagram sender
		 */ 
		public function get ip():String
		{
			return _ip;
		}

	}
}