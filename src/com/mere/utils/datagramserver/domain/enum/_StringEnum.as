package com.mere.utils.datagramserver.domain.enum
{
	internal class _StringEnum
	{
		private var _name:String;
		
		/**
		 * 
		 * @param name String the unique name of the Enum
		 * 
		 */
		public function _StringEnum(name:String)
		{
			_name=name;
		}
		
		/**
		 * 
		 * @return textualised contents for debugging
		 * 
		 */
		public function toString():String
		{
			return _name;
		}
	}
}