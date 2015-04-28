/**
 * @author Peter Hansen
 * @author Daniel Wilken
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Game.Model.Snake
{
	import de.p3337.zzznake.Game.Model.Field.Field;
	import de.p3337.zzznake.Game.Model.GameObject;
	import de.p3337.zzznake.Game.Model.Field.PlayingField;

	/**
	 * The SnakeElement is the base class for all components of a snake.
	 * 
	 * @see de.p3337.zzznake.Game.Model.Snake.SnakeHeadElement
	 * @see de.p3337.zzznake.Game.Model.Snake.SnakeTailElement
	 */
	public class SnakeElement extends GameObject {
		
		private var playingField:PlayingField;
		
		/**
		 * Creates a new SnakeElement.
		 * 
		 * @param startPosition The reference to a Field of the PlayingField this object is tied to.
		 * @param playingField The PlayingField.
		 * 
		 * @see de.p3337.zzznake.Game.Model.Field.PlayingField
		 */
		public function SnakeElement(position:Field, playingField:PlayingField) {
			super(position);
			this.playingField = playingField;
		}
	}
}