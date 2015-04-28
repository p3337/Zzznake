/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Menu.View
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	import de.p3337.zzznake.Main.Zzznake;
	import de.p3337.zzznake.Util.DefaultButton;

	/**
	 * The MenuView represents the entry point for this game.
	 * It contains the main logo and buttons to start the game or to see the highscore.  
	 */
	public class MenuView {
		
		private var _view:Sprite = new Sprite();
		
		private var _startGameBtn:DefaultButton;
		private var _openHighscoreBtn:DefaultButton;
		
		public function MenuView() {
			_view.x = Zzznake.ZZZNAKE_PADDING;
			draw();
		}
		
		public function get view():Sprite {
			return _view;
		}
		
		private function draw():void {
			[Embed(source='/de/p3337/zzznake/Library/Logo/Zzznake.png')]
			var SnakeLogoClass:Class;
			var snakeLogo:Bitmap = new SnakeLogoClass();
				snakeLogo.y = Zzznake.ZZZNAKE_HEIGHT / 2 - snakeLogo.height / 1.5;
			_view.addChild(snakeLogo);
			
			_openHighscoreBtn = new DefaultButton("Open Highscore");
			_openHighscoreBtn.y = Zzznake.ZZZNAKE_HEIGHT - _openHighscoreBtn._height - Zzznake.ZZZNAKE_PADDING;
			_view.addChild(_openHighscoreBtn);
			
			_startGameBtn = new DefaultButton("Start new Game");
			_startGameBtn.y = _openHighscoreBtn.y - openHighscoreBtn._height - Zzznake.ZZZNAKE_PADDING;
			_view.addChild(_startGameBtn);
		}

		public function get startGameBtn():DefaultButton {
			return _startGameBtn;
		}

		public function set startGameBtn(value:DefaultButton):void {
			_startGameBtn = value;
		}

		public function get openHighscoreBtn():DefaultButton {
			return _openHighscoreBtn;
		}

		public function set openHighscoreBtn(value:DefaultButton):void {
			_openHighscoreBtn = value;
		}
	}
}