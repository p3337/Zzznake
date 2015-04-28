/**
 * @author Peter Hansen
 * @author Daniel Wilken
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Game.Model.Snake
{
	import flash.events.EventDispatcher;
	
	import de.p3337.zzznake.Enum.Direction;
	import de.p3337.zzznake.Game.GameEvent;
	import de.p3337.zzznake.Game.Model.Field.Field;
	import de.p3337.zzznake.Game.Model.Field.PlayingField;

	/**
	 * The SnakeModel models a whole snake with its components and their behavior.
	 */
	public class SnakeModel extends EventDispatcher {
		
		private var _head:SnakeHeadElement;
		private var _tail:Array;
		private var _crunchedSnackQueue:Array;
		private var playingField:PlayingField;
		
		private var _fieldsMoved:uint;
		private var _snackCrunchCount:uint;
		
		/**
		 * Creates a new SnakeModel.
		 * 
		 * @param startPosition The reference to a Field of the PlayingField to which the snakes head will be tied to.
		 * @param playingField The PlayingField.
		 */
		public function SnakeModel(startPosition:Field, playingField:PlayingField) {
			this.playingField = playingField
			_head = new SnakeHeadElement(startPosition, playingField);
			_tail = new Array();
			_crunchedSnackQueue = new Array();
			_fieldsMoved = 0;
			_snackCrunchCount = 0;
		}
		
		public function reset(startPosition:Field):void {
			head.dispose();
			_head = new SnakeHeadElement(startPosition, playingField);
			
			for each(var elem:SnakeTailElement in tail) {
				elem.dispose();
			}
			_tail = new Array();
			
			_crunchedSnackQueue = new Array();
			_fieldsMoved = 0;
			_snackCrunchCount = 0;
		}
		
		/**
		 * This shall be executed when a new snack was crunched. 
		 */
		public function eat():void {
			_snackCrunchCount++;
			crunchedSnackQueue.push(head.getPosition());
		}
		
		/**
		 * This shall be executed if the user changes the snakes direction.
		 * 
		 * @param direction The new direction to move to.
		 * @see de.p3337.zzznake.Enum.Direction
		 */		
		public function changeDirection(direction:Direction):void {
			head.changeDirection(direction);
		}
		
		/**
		 * This shall be executed if the snake should move one step forward.
		 */	
		public function moveForward():void {
			_fieldsMoved++;
			moveTailForward();
			head.moveForward();
			notify();
		}
		
		private function moveTailForward():void {
			var lastTailPosition:Field = null;
			if(tail.length > 0) {
				var tailElement:SnakeTailElement = tail[tail.length -1];
				lastTailPosition = tailElement.getPosition();
			} else {
				lastTailPosition = head.getPosition();
			}
			
			for (var i:int = tail.length - 1; i >= 0; i--) {
				var currentTailElement:SnakeTailElement = tail[i];
				currentTailElement.moveForward();
			}
			
			digest(lastTailPosition);
		}
		
		private function digest(lastTailPosition:Field):void {
			if(crunchedSnackQueue.length > 0 && lastTailPosition !== null) {
				if(crunchedSnackQueue[0] === lastTailPosition) {
					var ancestor:SnakeElement = tail.length > 0? tail[tail.length - 1] : head;
					var snakeTailElement:SnakeTailElement = new SnakeTailElement(crunchedSnackQueue.shift(), playingField, ancestor);
					tail.push(snakeTailElement);
				}
			}
		}
		
		public function notify():void {
			dispatchEvent(new GameEvent(GameEvent.GAME_UPDATE));
		}

		public function get fieldsMoved():uint {
			return _fieldsMoved;
		}

		public function get snackCrunchCount():uint {
			return _snackCrunchCount;
		}

		public function get head():SnakeHeadElement {
			return _head;
		}

		public function get tail():Array {
			return _tail;
		}

		public function get crunchedSnackQueue():Array {
			return _crunchedSnackQueue;
		}
	}
}