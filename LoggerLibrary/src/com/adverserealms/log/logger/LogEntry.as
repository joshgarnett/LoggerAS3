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
	 * A single instance of a log message
	 */
    public class LogEntry
    {
        public var channel:LogChannel;
        public var timestamp:LogTimestamp;
        public var message:String;
        
		/**
		 * Based on the LogConfig values it will return a single line to be displayed.
		 */
        public function toLog() : String {
        	var result:String = "";
            
            if(LogConfig.SHOW_TIMESTAMP)
                result += timestamp.text + " - ";
            
            if(LogConfig.SHOW_CHANNEL_NAME)
            {
                result += channel.formattedChannelName + "  ";
            }
            
            result += message;
            
            return result;
        }
    }
}
