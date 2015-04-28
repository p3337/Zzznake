/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Enum
{
	import de.p3337.zzznake.Util.CStringUtils;

	/**
	 * This class provides a list of all available object types that a field can contain:
	 * EMPTY, SNAKE_HEAD, SNAKE_TAIL, or FOOD.
	 */
	public class GameObjectType {
		
		public var Text:String;
		{CStringUtils.InitEnumConstants(GameObjectType);} // static ctor
		
		public static const EMPTY:GameObjectType = new GameObjectType();
		public static const SNAKE_HEAD:GameObjectType = new GameObjectType();
		public static const SNAKE_TAIL:GameObjectType = new GameObjectType();
		public static const FOOD:GameObjectType = new GameObjectType();
	}
}