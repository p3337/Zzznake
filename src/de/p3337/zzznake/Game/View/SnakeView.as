/**
 * @author Peter Hansen
 * @author Daniel Wilken
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Game.View
{
	import flash.display.Bitmap;
	
	import flash.display.Sprite;
	
	import de.p3337.zzznake.Enum.Direction;
	import de.p3337.zzznake.Game.Model.GameModel;
	import de.p3337.zzznake.Game.Model.Field.Field;
	import de.p3337.zzznake.Game.Model.Snake.SnakeModel;
	import de.p3337.zzznake.Game.Model.Snake.SnakeTailElement;

	/**
	 * The SnakeView draws the snake with its components head, tail, and body parts stocked with snacks. 
	 */
	public class SnakeView {
		
		public static const SNAKE_TAIL_COLOR:uint = 0xFF0000;
		public static const SNAKE_FILLED_STOMACH_COLOR:uint = 0xFF6666;
		
		private var model:SnakeModel;
		private var _view:Sprite;
		
		/**
		 * Creates a new SnakeView. 
		 */
		public function SnakeView(snakeModel:SnakeModel) {
			model = snakeModel;
			_view = new Sprite();
			_view.mouseEnabled = false;
			_view.mouseChildren = false;
			
			draw();
		}
		
		public function update():void {
			_view.removeChildren();
			_view.graphics.clear();
			draw();
		}
		
		private function draw():void {
			drawSnakeHead();
			drawSnakeTail();
			drawFilledStomach();
		}
		
		private function drawSnakeHead():void {
			var posX:uint = model.head.getPosition().x;
			var posY:uint = model.head.getPosition().y;
			var width:uint = GameModel.SQUARE_SIZE - 2;
			var height:uint = GameModel.SQUARE_SIZE - 2;
			var rotation:int = 0;
			var scaleX:int = 1;
			
			switch(model.head.direction) {
				case Direction.UP:
					posX = posX * GameModel.SQUARE_SIZE + 2;
					posY = (posY + 1) * GameModel.SQUARE_SIZE;
					rotation = -90;
					break;
				case Direction.RIGHT:
					posX = posX * GameModel.SQUARE_SIZE;
					posY = posY * GameModel.SQUARE_SIZE + 2;
					break;
				case Direction.LEFT:
					posX = (posX + 1) * GameModel.SQUARE_SIZE;
					posY = posY * GameModel.SQUARE_SIZE + 2;
					scaleX = -1;
					break;
				case Direction.DOWN:
					posX = (posX + 1) * GameModel.SQUARE_SIZE - 1;
					posY = posY * GameModel.SQUARE_SIZE;
					rotation = 90;
					break;
			}
			
			var snakeHeadBitmap:Bitmap = model.head.getImage();
				snakeHeadBitmap.x = posX;
				snakeHeadBitmap.y = posY;
				snakeHeadBitmap.rotation = rotation;
				snakeHeadBitmap.width = width;
				snakeHeadBitmap.height = height;
				snakeHeadBitmap.scaleX = scaleX;
				
			_view.addChild(snakeHeadBitmap);
		}
		
		private function drawSnakeTail():void {
			for each(var elem:SnakeTailElement in model.tail) {
				var posX:uint = elem.getPosition().x;
				var posY:uint = elem.getPosition().y;
				
				_view.graphics.beginFill(SNAKE_TAIL_COLOR);
				_view.graphics.drawRect(posX * GameModel.SQUARE_SIZE, posY * GameModel.SQUARE_SIZE, GameModel.SQUARE_SIZE, GameModel.SQUARE_SIZE);
				_view.graphics.endFill();
			}
		}
		
		private function drawFilledStomach():void {
			for each(var elem:Field in model.crunchedSnackQueue) {
				if(elem !== model.head.getPosition()) {
					_view.graphics.beginFill(SNAKE_FILLED_STOMACH_COLOR);
					_view.graphics.drawRect(elem.x * GameModel.SQUARE_SIZE - 1, elem.y * GameModel.SQUARE_SIZE - 1, GameModel.SQUARE_SIZE + 1, GameModel.SQUARE_SIZE + 1);
					_view.graphics.endFill();
				}
			}
		}
		
		public function get view():Sprite {
			return _view;
		}
	}
}