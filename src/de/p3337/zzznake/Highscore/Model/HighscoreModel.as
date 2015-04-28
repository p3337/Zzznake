/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Highscore.Model
{
	import flash.events.EventDispatcher;
	import flash.net.SharedObject;
	
	import de.p3337.zzznake.Game.GameEvent;

	/**
	 * The HighscoreModel models a high score table with ten entries.
	 */
	public class HighscoreModel extends EventDispatcher {
		
		private var highscoreFile:SharedObject;
		private var _rankingObject:Object = new Object();
		private var _lastScore:uint;
		
		/**
		 * Creates a new HighscoreModel and tries to load a local shared object if any.
		 * 
		 * @see flash.net.SharedObject
		 */
		public function HighscoreModel() {
			highscoreFile = SharedObject.getLocal("highscore");
			if(highscoreFile.data.ranking == null) {
				initRankingObject();
			} else {
				_rankingObject = highscoreFile.data.ranking;
			}
		}
		
		private function initRankingObject():void {
			for (var i:int = 0; i < 10; i++) {
				_rankingObject[i] = {score:0, name:''};
			}
			storeRankingObject();
		}
		
		private function storeRankingObject():void {
			highscoreFile.data.ranking = _rankingObject;
			highscoreFile.flush();
		}
		
		/**
		 * Calculates and stores the attained score.
		 *  
		 * @param numberOfFieldsMoved The number of fields the snake has moved.
		 * @param numberOfFoodCrunched The number of food the snake has collected underway.
		 * @param movementSpeed The speed level the snake has reached.
		 */
		public function calculateAndSaveScore(numberOfFieldsMoved:uint, numberOfFoodCrunched:uint, movementSpeed:uint):void {
			_lastScore = numberOfFoodCrunched;
			dispatchEvent(new GameEvent(GameEvent.GAME_UPDATE));
		}
		
		/**
		 * Stores the cached score to a locally shares object.
		 * 
		 * @see flash.net.SharedObject.
		 */
		public function storeNewEntry(name:String):void {
			var tempArr:Array = new Array();
			var index:uint = 10;
			for (var i:uint = 0; i < 10; i++) {
				if(index == 10 && _rankingObject[i].score < _lastScore) {
					index = i;
				}
				
				tempArr.push(new Array(_rankingObject[i].score, _rankingObject[i].name));
			}
			
			tempArr.splice(index, 0, new Array(_lastScore, name));
			_rankingObject = new Object();
			for (var j:uint = 0; j < 10; j++) {
				_rankingObject[j] = {score:tempArr[j][0], name:tempArr[j][1]};
			}
			storeRankingObject();
			dispatchEvent(new GameEvent(GameEvent.GAME_UPDATE));
		}

		public function get rankingObject():Object {
			return _rankingObject;
		}

		public function get lastScore():uint {
			return _lastScore;
		}


	}
}