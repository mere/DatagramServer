package com.mere.utils.datagramserver.domain
{
	import com.mere.utils.datagramserver.domain.enum.DatagramStatusEnum;
	
	import mx.collections.ArrayList;

	[Bindable]
	public final class DatagramModel
	{
		public var host:String;
		public var port:String;
		public var status:DatagramStatusEnum = DatagramStatusEnum.DISCONNECTED;
		public var hostsAvailable:ArrayList = new ArrayList();
	}
}