package com.mere.utils.datagramserver.domain.enum
{
	public final class DatagramStatusEnum extends _StringEnum
	{
		/**
		 * 	Default state
		 */
		public static const DISCONNECTED: DatagramStatusEnum = new DatagramStatusEnum('DISCONNECTED');
		
		/**
		 * 	Establishing connection
		 */
		public static const CONNECTING: DatagramStatusEnum = new DatagramStatusEnum('CONNECTING');
		
		/**
		 * 	Listening on given port
		 */
		public static const CONNECTED: DatagramStatusEnum = new DatagramStatusEnum('CONNECTED');
		
		/**
		 * 	Conenction to given port failed
		 */
		public static const FAILED: DatagramStatusEnum = new DatagramStatusEnum('FAILED');
		
		/**
		 * 	Constructor
		 */ 
		public function DatagramStatusEnum(name:String)
		{
			super(name);
		}
	}
}