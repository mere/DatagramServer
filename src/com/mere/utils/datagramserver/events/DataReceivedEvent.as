package com.mere.utils.datagramserver.events
{
	import flash.utils.ByteArray;
	
	import org.spicefactory.lib.task.util.XmlLoaderTask;

	public final class DataReceivedEvent
	{
		private var _ip:String;
		private var _data:ByteArray;
		private var _type:String;
		
		public function DataReceivedEvent(ip:String, data:ByteArray)
		{
			_ip = ip;
			_type = data.readUTFBytes( 3 );
			_data = data;
		}
		
		public function get type():String
		{
			return _type;
		}

		public function get data():ByteArray
		{
			var ba:ByteArray = new ByteArray();
			_data.position=3;
			_data.readBytes(ba);
			return ba;
		}
		public function get string():String
		{
			_data.position=3;
			var length:uint = _data.bytesAvailable;
			var contents:String = _data.readUTFBytes( length);
			return contents;
		}
		public function get xml():XML
		{
			return XML(string);
		}

		public function get ip():String
		{
			return _ip;
		}

	}
}