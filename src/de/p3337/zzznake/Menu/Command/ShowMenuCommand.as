/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Menu.Command
{
	import de.p3337.zzznake.Enum.GameState;
	import de.p3337.zzznake.Main.Zzznake;

	/**
	 * The ShowMenuCommand provides an action to show the main menu.
	 */
	public class ShowMenuCommand implements ICommand {
		
		/**
		 * Load the MenuView and removes the current Game if started.
		 */
		public function execute():void {
			Zzznake.getInstance().setBackCommand(new ExitGameCommand());
			if(Zzznake.getInstance().gameModel.gameState === GameState.STARTED) {
				Zzznake.getInstance().gameController.removeGame();
			}
			Zzznake.getInstance().showMenu();
		}
	}
}