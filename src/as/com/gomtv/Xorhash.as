package com.gomtv {
	
	import com.adobe.crypto.MD5;

	public class  Xorhash extends Sprite {
		
		protected var m_key:String;
		protected var m_xorkey:String;
		protected var m_keylen:Number;
		protected var m_token:String;
		
		public function Xorhash(key:String, keylen:Number = 16, token:String = ",") {
			m_key = key;
			m_xorkey = md5bin(key);
			m_keylen = keylen;
			m_token = token;
		}
		
		public function encRndChr(src:Array):String {
			var dest:String = "",
				i:Number = 0;
			
			for (; i < src.length; i++) {
				if (dest) {
					dest += m_token;
				}
				dest += rndChr() + m_token + src[i];
			}
			
			return enc(dest);
		}
		
		public function decRndChr(src:String):Array {
			var dest:Array = new Array(),
				decoded:Array = dec(src).split(m_token),
				i:Number = 0;

			for (; i < decoded.length; i++) {
				if (i % 2) {
					dest.push(decoded[i]);
				}
			}
		
			return dest;
		}
		
		public function enc(src:String):String {
			var dest:String = "",
				keypos:Number = 0,
				i:Number = 0;
			
			for (; i < src.length; i++) {
				dest += String.fromCharCode(src.charCodeAt(i) ^ m_xorkey.charCodeAt(keypos));
				keypos = (keypos + 1) % m_keylen;
			}
		
			return bin2hex(dest);
		}
		
		public function dec(src:String):String {
			var bSrc:String= hex2bin(src),
				dest:String = "",
				keypos:Number = 0,
				i:Number = 0;
				
			for (; i < bSrc.length; i++) {
				dest += String.fromCharCode(bSrc.charCodeAt(i) ^ m_xorkey.charCodeAt(keypos));
				keypos = (keypos + 1) % m_keylen;
			}
			
			return dest;
		}
					
		public function get key():String {
			return m_key;
		}
		
		public function get keylen():Number {
			return m_keylen;
		}
		
		public function get token():String {
			return m_token;
		}
		
		public function set key(value:String):void {
			m_key = value;
			m_xorkey = md5bin(value);
		}
		
		public function set keylen(value:Number):void{
			m_keylen = value;
		}
		
		public function set token(value:String):void {
			m_token = value;
		}
		
		protected function rndChr():String {
			var min = 33,
				max = 125,
				n = Math.random() * (max - min) + min,
				chr = String.fromCharCode(n);
			
			if (chr == m_token) {
				chr = String.fromCharCode(n + 1);
			}
			
			return chr;
		}
		
		protected function md5bin(src:String):String {
			var md5str:String = MD5.hash(src),
				dest:String = "",
				i:Number = 0;
				
			for (; i < 32; i += 2) {
				dest += String.fromCharCode(int("0x"+md5str.charAt(i + 1)) + int("0x"+md5str.charAt(i)) * 16);
			}

			return dest;
		}
		
		protected function hex2bin(src:String):String {
			var dest:String = "",
				i:Number = 0;
			
			do {
				dest += String.fromCharCode(int("0x" + (src.charAt(i) + src.charAt(i + 1))));
				i += 2;
			} while (i < src.length);
			
			return dest;
		}
		
		protected function bin2hex(src:String):String {
			var dest:String = "",
				chr:String = "",
				i:Number = 0;
				
			for (; i < src.length; i++) {
				chr = src.charCodeAt(i).toString(16);
				if (chr.length < 2) {
					chr = "0" + chr;
				}
				dest += chr;
			}
			
			return dest;
		}
	}
}