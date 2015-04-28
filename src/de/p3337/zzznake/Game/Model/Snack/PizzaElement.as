/**
 * @author Peter Hansen
 * @author Daniel Wilken
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Game.Model.Snack
{
	import flash.display.Bitmap;
	
	import de.p3337.zzznake.Enum.GameObjectType;
	import de.p3337.zzznake.Game.Model.Field.Field;

	/**
	 * The PizzaElement is a specialization of a SnackElement and represents a pizza slice.
	 * 
	 * @see de.p3337.zzznake.Game.Model.Snack.SnackElement
	 */
	public class PizzaElement extends SnackElement {
		
		[Embed(source='/de/p3337/zzznake/Library/pizza_slice.png')]
		private var PizzaSliceClass:Class;
		private var pizzaSliceBitmap:Bitmap;
		
		/**
		 * Creates a new PizzaElement.
		 * 
		 * @param position The reference to a Field of the PlayingField this object is tied to.
		 * @see de.p3337.zzznake.Game.Model.Field.PlayingField
		 */
		public function PizzaElement(position:Field) {
			super(position);
			pizzaSliceBitmap = new PizzaSliceClass();
		}
		
		override public function dispose():void {
			super.dispose();
		}
		
		override public function getType():GameObjectType {
			return GameObjectType.FOOD;
		}
		
		override public function getImage():Bitmap {
			return pizzaSliceBitmap;
		}
	}
}