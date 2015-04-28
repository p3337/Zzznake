/**
 * @author Peter Hansen
 * @author Daniel Wilken
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Game.View
{
	import flash.display.Sprite;
	
	import de.p3337.zzznake.Game.Model.GameModel;
	import de.p3337.zzznake.Util.DefaultInput;

	/**
	 * The GameInfoBox is a wrapper for showing the current game stats among each other.
	 * This includes the current speed level, the number of snacks the snake has collected underway, and the number of fields moved.
	 */
	public class GameInfoBox extends Sprite {
		
		private var gameModel:GameModel;
		
		private var speedLevelIF:DefaultInput;
		private var snacksCrunchedIF:DefaultInput;
		private var fieldsMovedIF:DefaultInput;
		
		public function GameInfoBox(gameModel:GameModel) {
			super();
			
			this.gameModel = gameModel;
			
			speedLevelIF = new DefaultInput("Speed level", "0", "dynamic");
			addChild(speedLevelIF);

			snacksCrunchedIF = new DefaultInput("Snacks crunched", "0", "dynamic");
			snacksCrunchedIF.y = speedLevelIF.y + snacksCrunchedIF.height + 8;
			addChild(snacksCrunchedIF);
			
			fieldsMovedIF = new DefaultInput("Fields moved", "0", "dynamic");
			fieldsMovedIF.y = snacksCrunchedIF.y + snacksCrunchedIF.height + 8;
			addChild(fieldsMovedIF);
		}
		
		public function update():void {
			speedLevelIF.setInputValue(gameModel.movementSpeed.toString());
			snacksCrunchedIF.setInputValue(gameModel.snakeModel.snackCrunchCount.toString());
			fieldsMovedIF.setInputValue(gameModel.snakeModel.fieldsMoved.toString());
		}
	}
}