/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Enum
{
	import de.p3337.zzznake.Util.CStringUtils;

	/**
	 * This class provides a list of all available state a game can have:
	 * INITIALIZED, STARTED, PAUSED, or ENDED.
	 */
	public class GameState {
		
		public var Text:String;
		{CStringUtils.InitEnumConstants(GameState);} // static ctor
		
		public static const INITIALIZED:GameState = new GameState();
		public static const STARTED:GameState = new GameState();
		public static const PAUSED:GameState = new GameState();
		public static const ENDED:GameState = new GameState();
	}
}