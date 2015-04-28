/**
 * @author Peter Hansen
 * @author Daniel Wilken
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Game.Model.Snake
{
	import flash.display.Bitmap;
	
	import de.p3337.zzznake.Enum.Direction;
	import de.p3337.zzznake.Enum.GameObjectType;
	import de.p3337.zzznake.Game.Model.Field.Field;
	import de.p3337.zzznake.Game.Model.Field.PlayingField;

	/**
	 * The SnakeHeadElement represents the head of the snake.
	 */
	public class SnakeHeadElement extends SnakeElement {
		
		private var _direction:Direction;
		private var playingField:PlayingField;
		
		[Embed(source='/de/p3337/zzznake/Library/head.png')]
		private var snakeHeadClass:Class;
		private var snakeHeadBitmap:Bitmap;
		
		/**
		 * Creates a new SnakeHeadElement.
		 * 
		 * @param startPosition The reference to a Field of the PlayingField this object is tied to.
		 * @param playingField The PlayingField.
		 * 
		 * @see de.p3337.zzznake.Game.Model.Field.PlayingField
		 */
		public function SnakeHeadElement(startPosition:Field, playingField:PlayingField) {
			super(startPosition, playingField);
			this.playingField = playingField;
			_direction = Direction.LEFT;
			
			snakeHeadBitmap = new snakeHeadClass();
		}
		
		override public function dispose():void {
			super.dispose();
		}
		
		override public function getType():GameObjectType {
			return GameObjectType.SNAKE_HEAD;
		}
		
		public function get direction():Direction {
			return _direction;
		}
		
		/**
		 * Updates the direction in which the snakes head will move.
		 * 
		 * @param direction The new direction.
		 * @see de.p3337.zzznake.Enum.Direction
		 */
		public function changeDirection(direction:Direction):void {
			if(direction !== Direction.getInverseDirection(direction)) {
				this._direction = direction;
			}
		}
		
		/**
		 * Moves the snakes head one field into the current direction. 
		 */
		public function moveForward():void {
			switch(this.direction) {
				case Direction.UP: moveUp(); break;
				case Direction.RIGHT: moveRight(); break;
				case Direction.DOWN: moveDown(); break;
				case Direction.LEFT: moveLeft(); break;
			}
		}
		
		private function moveUp():void {
			super.setPosition(playingField.getFieldAboveField(super.getPosition()));
		}
		
		private function moveRight():void {
			super.setPosition(playingField.getFieldToTheRightOfField(super.getPosition()));
		}
		
		private function moveDown():void {
			super.setPosition(playingField.getFieldBelowField(super.getPosition()));
		}
		
		private function moveLeft():void {
			super.setPosition(playingField.getFieldToTheLeftOfField(super.getPosition()));
		}
		
		public function getImage():Bitmap {
			return snakeHeadBitmap;
		}
	}
}