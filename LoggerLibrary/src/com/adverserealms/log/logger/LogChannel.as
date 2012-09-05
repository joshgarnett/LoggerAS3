/**
 * Copyright (c) 2008 Joshua Garnett
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package com.adverserealms.log.logger
{
	/**
	 * Stores the various details associated with a logging channel.
	 */
    public class LogChannel
    {
    	public static const DEBUG   :LogChannel = new LogChannel("Debug",	Level.DEBUG);
        public static const INFO    :LogChannel = new LogChannel("Info",	Level.INFO);       
        public static const WARN    :LogChannel = new LogChannel("Warn",	Level.WARN);
        public static const ERROR   :LogChannel = new LogChannel("Error",	Level.ERROR);
        public static const FATAL   :LogChannel = new LogChannel("Fatal",	Level.FATAL);
		public static const CONSOLE :LogChannel = new LogChannel("Console",	Level.CONSOLE);
        
		private var _name:String;
		private var _level:Number;
		private var _formattedChannelName:String;
		
		/**
		 * The name of the log channel that is displayed in the logs.
		 */
        public function get name() : String { return _name };
		
		/**
		 * Returns the channel name formatted between two | characters
		 * 
		 * <p>
		 * Example:  Debug becomes |Debug| and Warn becomes |Warn |
		 * </p>
		 */
		public function get formattedChannelName() : String { return _formattedChannelName };
		
		/**
		 * The numeric value describing the log level of this channel.
		 */
		public function get level() : Number { return _level };
        
        public function LogChannel(name:String, level:Number)
        {
			_name = name;
			_level	= level;
			_formattedChannelName = formatChannelName(this);
        }
        
		/**
		 * Adds white space if needed and surrounds the name with | | characters.
		 */
        private static function formatChannelName(channel:LogChannel):String
        {
            var name:String = channel.name.toUpperCase();
            while(name.length < 5) {
                name += " ";
            }
            var result:String = "| " + name + " |";
            
            return result;
        }
    }
}
