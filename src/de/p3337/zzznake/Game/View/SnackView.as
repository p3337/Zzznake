/**
 * @author Peter Hansen
 * @author Daniel Wilken
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Game.View
{
	import flash.display.Bitmap;
	
	import flash.display.Sprite;
	
	import de.p3337.zzznake.Game.Model.GameModel;

	/**
	 * The SnackView draws all available snacks. 
	 */
	public class SnackView {
		
		private var model:GameModel;
		private var _view:Sprite;
		
		public function SnackView(gameModel:GameModel) {
			model = gameModel;
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
			var posX:uint = model.snackElement.getPosition().x * GameModel.SQUARE_SIZE;
			var posY:uint = model.snackElement.getPosition().y * GameModel.SQUARE_SIZE;
			
			var pizzaSliceBitmap:Bitmap = model.snackElement.getImage();
			pizzaSliceBitmap.x = posX;
			pizzaSliceBitmap.y = posY;
			pizzaSliceBitmap.width = GameModel.SQUARE_SIZE;
			pizzaSliceBitmap.height = GameModel.SQUARE_SIZE;
			
			_view.addChild(pizzaSliceBitmap);
		}
		
		public function get view():Sprite {
			return _view;
		}
	}
}