/**
 * @author Peter Hansen
 * @author Daniel Wilken
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Game.Model.Field
{
	import de.p3337.zzznake.Game.Model.GameObject;
	import de.p3337.zzznake.Game.Model.Collision.Collision;
	import de.p3337.zzznake.Game.Model.Collision.CollisionType;

	/**
	 * The Field represents a specific cell on the PlayingField.
	 * It has a two dimensional position and can carry a list of GameObjects.
	 * 
	 * @see de.p3337.zzznake.Game.Model.Field.PlayingField
	 * @see de.p3337.zzznake.Game.Model.GameObject 
	 */
	public class Field {
		
		private var _x:uint;
		private var _y:uint;
		
		private var _content:Array;
		
		/**
		 * Creates a new Field.
		 * 
		 * @param x The row index of the PlayingField.
		 * @param y The column index of the PlayingField.
		 */
		public function Field(x:uint, y:uint) {
			_x = x;
			_y = y;
			_content = new Array();
		}
		
		/**
		 * Adds a GameObject content to the Fields content list.
		 * 
		 * @param content A GameObject to add.
		 */
		public function addContent(content:GameObject):void {
			if(_content.indexOf(content) === -1) {
				_content.push(content);
			} else {
				trace('could not be added, because is already part of field content array'); 
			}
		}
		
		/**
		 * Removes a GameObject content from the Fields content list.
		 * 
		 * @param content A GameObject to remove.
		 */
		public function removeContent(content:GameObject):void {
			var index:int = _content.indexOf(content);
			if(index !== -1) {
				_content.splice(index, 1);
			} else {
				trace('could not be removed, because it was no item of field content array.'); 
			}
		}
		
		/**
		 * Removes all GameObject from the Fields content list.
		 */
		public function removeAllContent():void {
			_content = new Array();
		}
		
		public function hasContent():Boolean {
			return _content.length > 0;
		}
		
		public function hasCollision():Boolean {
			return _content.length > 1;
		}
		
		public function getCollisionType():CollisionType {
			var collision:Collision = new Collision(_content[0], _content[1]);
			return collision.getCollisionType();
		}

		public function get x():uint {
			return _x;
		}

		public function set x(value:uint):void {
			_x = value;
		}

		public function get y():uint {
			return _y;
		}

		public function set y(value:uint):void {
			_y = value;
		}
		
		public function toString():String {
			return "(" + x + ", " + y + ")"; 
		}
	}
}