package com.mere.utils.datagramserver.domain
{
	import mx.collections.ArrayList;

	[Bindable]
	public final class DatagramModel
	{
		public var host:String;
		public var port:String;
		public var hostsAvailable:ArrayList = new ArrayList();
	}
}