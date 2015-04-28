/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Enum
{
	import de.p3337.zzznake.Util.CStringUtils;

	/**
	 * This class provides a list of all available directions:
	 * UP, RIGHT, DOWN, or LEFT.
	 */
	public class Direction {
		
		public var Text:String;
		{CStringUtils.InitEnumConstants(Direction);} // static ctor
		
		public static const UP:Direction = new Direction();
		public static const RIGHT:Direction = new Direction();
		public static const DOWN:Direction = new Direction();
		public static const LEFT:Direction = new Direction();
		
		
		/**
		 * Inverts the given direction.
		 * 
		 * @param direction The direction to invert.
		 * @return The inverted direction.
		 */
		public static function getInverseDirection(direction:Direction):Direction {
			var inverseDirection:Direction;
			switch(direction) {
				case UP: inverseDirection = DOWN; break;
				case RIGHT: inverseDirection = LEFT; break;
				case DOWN: inverseDirection = UP; break;
				case LEFT: inverseDirection = RIGHT; break;
			}
			return inverseDirection;
		}
	}
}