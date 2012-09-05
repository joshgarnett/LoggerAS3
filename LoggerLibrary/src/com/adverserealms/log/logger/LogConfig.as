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
    public class LogConfig
    {
        /**
         * The maximum number of entries that will be stored
         */ 
        public static var MAX_ENTRIES:Number = 500;
        
        /**
         * Used to determine whether or not to display the timestamp
         */
        public static var SHOW_TIMESTAMP:Boolean = true;
        
        /**
         * Used to determine whether or not to display the channel name
         */
        public static var SHOW_CHANNEL_NAME:Boolean = true;
        
        /**
         * Set to true to have Logger also forward messages to the trace() statement
         */
        public static var PASS_TO_TRACE:Boolean = true;
        
        /**
         * Toggle to determine which way logs are displayed
         */
        public static var REVERSE_ORDER:Boolean = false;
        
        /**
         * Set the level of logs that are displayed in the system
         */
        public static var LOG_LEVEL:Number = Level.DEBUG;
    }
}
