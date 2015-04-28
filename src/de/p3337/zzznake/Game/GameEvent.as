/**
 * @author Peter Hansen
 * @author Daniel Wilken
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Game 
{
	import flash.events.Event;
	
	/**
	 * This class provides a list of all available game events that can be dispatched.
	 */
	public class GameEvent extends Event {
		
		public static const GAME_OVER:String = "GameOver";
		public static const GAME_START:String = "GameStart";
		public static const GAME_END:String = "GameEnd";
		public static const GAME_UPDATE:String = "GameUpdate";
		public static const SNACK_CRUNCHED:String = "SnackCrunched";
		
		/**
		 * Creates a new GameEvent.
		 * 
		 * @inheritDoc
		 */
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
		
		// always create a clone() method for events in case you want to redispatch them.
		public override function clone():Event {
			return new GameEvent(type, bubbles, cancelable);
		}
	}
}