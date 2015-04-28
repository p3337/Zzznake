/**
 * @author Peter Hansen
 * @author Daniel Wilken
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Game.Model.Collision
{
	import de.p3337.zzznake.Util.CStringUtils;

	/**
	 * This class provides a list of all available collitions that can occur for the snake head and other objects:
	 * CRUNCH, OUCH, or NONE.
	 */
	public class CollisionType {
		
		public var Text:String;
		{CStringUtils.InitEnumConstants(CollisionType);} // static ctor
		
		/**
		 * This type indicates that the snakes head collided with a SnackElement
		 */
		public static const CRUNCH:CollisionType = new CollisionType();
		
		/**
		 * This type indicates that the snakes head collided with a SnakeElement
		 */
		public static const OUCH:CollisionType = new CollisionType();
		
		/**
		 * This type indicates that there was no collision.
		 */
		public static const NONE:CollisionType = new CollisionType();
	}
}