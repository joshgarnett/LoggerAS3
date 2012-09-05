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
package com.adverserealms.log
{
	import com.adverserealms.log.logger.*;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * Dispatched when the log text has been updated
	 */
	[Event(name="logUpdated", type="flash.events.Event")]
	
	/**
	 * This is the main class that should be used for creating log messages.  Output options
	 * can be configured in the LogConfig class.
	 * 
	 * @see com.adverserealms.log.logger.LogConfig
	 */
    public class Logger extends EventDispatcher
    {
		private static var _instance:Logger = Logger.getInstance();
		
		public function Logger() : void {
			if(_instance != null) {
				throw new Error("Error: Use Logger.getInstance() instead");
			}
		}
		
		public static function getInstance() : Logger {
			if(_instance == null) {
				_instance = new Logger();
			}
			return _instance;
		}
		
        /**
		 * Text output of all LogEntries
		 */
        public var text:String = "";
		
		public function updatedText() : void {
			dispatchEvent(new Event("logUpdated"));
		}
		
		/**
		 * Array of LogEntries
		 */
		private static var _log:Array = new Array();
        
		/**
		 * Adds a debug log message.
		 *
		 * @param msg The log message.
		 */
        public static function debug(msg:String):void
        {
			CONFIG::debug {
        		log(msg, LogChannel.DEBUG);
			}
        }
		
		/**
		 * Adds an info log message.
		 *
		 * @param msg The log message.
		 */
		public static function info(msg:String):void
		{
			CONFIG::debug {
				log(msg, LogChannel.INFO);
			}
		}
        
		/**
		 * Adds a warn log message.
		 *
		 * @param msg The log message.
		 */
		public static function warn(msg:String):void
		{
			CONFIG::debug {
				log(msg, LogChannel.WARN);
			}
		}
		
		/**
		 * Adds an error log message.
		 *
		 * @param msg The log message.
		 */
        public static function error(msg:String):void
        {
			CONFIG::debug {
            	log(msg, LogChannel.ERROR);
			}
        }
        
		/**
		 * Adds a fatal log message.
		 *
		 * @param msg The log message.
		 */
		public static function fatal(msg:String):void
		{
			CONFIG::debug {
				log(msg, LogChannel.FATAL);
			}
		}
		
		/**
		 * Adds a console log message.
		 *
		 * @param msg The log message.
		 */
		public static function console(msg:String):void
		{
			CONFIG::debug
			{
				log(msg, LogChannel.CONSOLE);
			}
		}
		
		/**
		 * Clears the current logs.
		 */
		public static function clear():void
		{
			_instance.text = "";
			_log = new Array();
			updateLogText();
		}
		
		/**
		 * This sets the showTimeStamp value and updates the text
		 */  
		public static function toggleTimeStamps(enabled:Boolean) : void {
			LogConfig.SHOW_TIMESTAMP = enabled;
			updateLogText();
		}
		
		/**
		 * This sets the SHOW_CHANNEL_NAME value and updates the text
		 */  
		public static function toggleChannels(enabled:Boolean) : void {
			LogConfig.SHOW_CHANNEL_NAME = enabled;
			updateLogText();
		}
        
        private static function log(msg:String, channel:LogChannel):void
        {
            // Set default channel to info
            if(channel == null) {
				throw new Error("Logger.log: channel value is null");
			}
                
           	// throw away log if channel level is less then current log level
           	if(channel.level < LogConfig.LOG_LEVEL) {
           		return;
           	}
                
            //Create the new Log Entry
            var entry:LogEntry = new LogEntry()
            entry.timestamp = new LogTimestamp();
            entry.channel = channel;
            entry.message = msg;
                
            _log.push(entry);
            
            if(_log.length > LogConfig.MAX_ENTRIES)
            {
                _log.shift();
            }
            
            updateOutput(entry);
            
            if(LogConfig.PASS_TO_TRACE)
            {
                trace(entry.toLog());
            }
			
			_instance.updatedText();
        }
		
        /**
         * This should be called when any flags or channels have
         * been changed so that the output is correct
         */ 
        private static function updateLogText() : void {
            _instance.text = "";
            
            for(var i:Number = 0; i < _log.length; i++) {
            	var entry:LogEntry = _log[i] as LogEntry;
            	updateOutput(entry);
            }
			
			_instance.updatedText();
        }
        
		/**
		 * Adds the LogEntry to the Logger.text field.
		 */
        private static function updateOutput(entry:LogEntry):void
        {
        	var log:String = entry.toLog();
        	
            if(LogConfig.REVERSE_ORDER)
            {
				_instance.text = log + "\n" + _instance.text;
            }
            else
            {
				_instance.text += "\n" + log;
            }
        }
    }
}
