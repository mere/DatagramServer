package com.mere.utils.datagramserver.events
{
	import com.mere.utils.datagramserver.domain.enum.DatagramStatusEnum;
	
	import flash.utils.ByteArray;
	
	import org.spicefactory.lib.task.util.XmlLoaderTask;

	public final class DatagramStatusEvent
	{
		private var _status:DatagramStatusEnum;
		private var _message:String;
		
		/**
		 * 	Dispatched when the datagram server receives a datagram packet.
		 *  @param ip the IP of the sender
		 *  @param data the data sent in the datagram
		 */ 
		public function DatagramStatusEvent(status:DatagramStatusEnum, message:String)
		{
			_status = status
			_message = message;
		}
		
		/**
		 * 	@return Error log or connection details
		 */ 
		public function get message():String
		{
			return _message;
		}

		/**
		 * 	@return status of the datagram server as DatagramStatusEnum
		 */ 
		public function get status():DatagramStatusEnum
		{
			return _status;
		}

	}
}