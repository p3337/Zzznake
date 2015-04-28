/**
 * @author Peter Hansen
 * @author Daniel Wilken
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Game.Model.Snake
{
	import de.p3337.zzznake.Enum.GameObjectType;
	import de.p3337.zzznake.Game.Model.Field.Field;
	import de.p3337.zzznake.Game.Model.Field.PlayingField;

	/**
	 * The SnakeTailElement represents one part of the whole tail.
	 */
	public class SnakeTailElement extends SnakeElement {
		
		private var ancestor:SnakeElement;
		
		/**
		 * Creates a new SnakeTailElement.
		 * 
		 * @param position The reference to a Field of the PlayingField this object is tied to.
		 * @param playingField The PlayingField.
		 * @param ancestor The antecedent SnakeElement of this new SnakeTailElement.
		 *
		 * @see de.p3337.zzznake.Game.Model.Field.PlayingField
		 * @see de.p3337.zzznake.Game.Model.Snake.SnakeElement
		 */
		public function SnakeTailElement(position:Field, playingField:PlayingField, ancestor:SnakeElement) {
			super(position, playingField);
			this.ancestor = ancestor;
		}
		
		override public function getType():GameObjectType {
			return GameObjectType.SNAKE_TAIL;
		}
		
		override public function dispose():void {
			ancestor = null;
			super.dispose();
		}
		
		public function moveForward():void {
			this.setPosition(ancestor.getPosition());
		}
	}
}