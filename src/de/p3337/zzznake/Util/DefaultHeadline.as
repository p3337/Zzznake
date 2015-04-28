/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Util
{
	import flash.text.AntiAliasType;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import flash.display.Sprite;
	
	import de.p3337.zzznake.Main.Zzznake;

	/**
	 * This class provides a simple headline for general use.
	 */
	public class DefaultHeadline extends Sprite {
		private var styleSheet:StyleSheet;
		private var headline:TextField;
		
		
		/**
		 * Creates a new headline.
		 * 
		 * @param text The value for the default headline.
		 */
		public function DefaultHeadline(text:String) {
			super();
			
			mouseChildren = false;
			
			styleSheet = new StyleSheet();
			styleSheet.setStyle(".label", {
				color:'#000000',
				fontWeight:'bold',
				fontSize:'20',
				fontFamily:'Courier New'
			});
			
			addHeadline(text);
		}
		
		private function addHeadline(text:String):void {
			headline = new TextField();
			headline.styleSheet = styleSheet;
			headline.htmlText = "<span class='label'>" + text + "</span>";
			headline.autoSize = TextFieldAutoSize.LEFT;
			headline.width = Zzznake.ZZZNAKE_WIDTH;
			headline.y = 5;
			headline.antiAliasType = AntiAliasType.ADVANCED;
			headline.mouseEnabled = false;
			addChild(headline);
		}
		
		public function updateHeadline(text:String):void {
			headline.htmlText = "<span class='label'>" + text + "</span>";
		}
	}
}