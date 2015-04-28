/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Menu.Command
{
	import flash.desktop.NativeApplication;

	/**
	 * The ExitGameCommand provides an action to exit this game.
	 */
	public class ExitGameCommand implements ICommand {
		
		/**
		 * Exits the game.
		 */
		public function execute():void {
			NativeApplication.nativeApplication.exit();
		}
	}
}