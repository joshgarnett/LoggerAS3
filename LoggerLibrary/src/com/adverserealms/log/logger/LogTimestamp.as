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
	 * A custom class for creating a specially formatted timestamp.
	 */
    public class LogTimestamp
    {
        public var text:String;
        
        private var date:Date = new Date();
        
        public function LogTimestamp()
        {	
        	var hours:String = zeroFill(date.getHours(),2);
        	var minutes:String = zeroFill(date.getMinutes(),2);
        	var seconds:String = zeroFill(date.getSeconds(),2);
        	var milli:String = zeroFill(date.getMilliseconds(),3);
        	
        	var timeString:String = hours+"."+minutes+"."+seconds+"."+milli;
            
            text = timeString;
        }
        
		/**
		 * Returns a number as a string prefixed with enough zeros to satisfy the digits parameter.
		 */
        private static function zeroFill(value:Number, digits:Number) : String {
        	var stringValue:String = "";
        	if(value >= 100) {
        		stringValue = String(value);
        	}
        	else if(value >= 10) {
        		if(digits == 3) {
        			stringValue = "0"+value;
        		}
        		else {
        			stringValue = String(value);
        		}
        	}
        	else if(value >= 0) {
        		if(digits == 3) {
        			stringValue = "00"+value;
        		}
        		else {
        			stringValue = "0"+value;
        		}
        	}
        	else {
        		if(digits == 3) {
        			stringValue = "000";
        		}
        		else {
        			stringValue = "00";
        		}
        	}
        	return stringValue;
        }
    }
}
