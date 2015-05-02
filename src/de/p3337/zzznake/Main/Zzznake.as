/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Main 
{
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.system.Capabilities;
	import flash.ui.Keyboard;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import de.p3337.zzznake.Enum.SoundFile;
	import de.p3337.zzznake.Game.Controller.GameController;
	import de.p3337.zzznake.Game.Model.GameModel;
	import de.p3337.zzznake.Highscore.Controller.HighscoreController;
	import de.p3337.zzznake.Highscore.Model.HighscoreModel;
	import de.p3337.zzznake.Menu.Command.ExitGameCommand;
	import de.p3337.zzznake.Menu.Command.ICommand;
	import de.p3337.zzznake.Menu.Controller.MenuController;
	import de.p3337.zzznake.Sound.Jukebox;
	
	[SWF(frameRate="60", width="480", height="800")]
	public final class Zzznake extends Sprite {
		
		public static const ZZZNAKE_WIDTH:uint = 480;
		public static const ZZZNAKE_HEIGHT:uint = 800;
		public static const ZZZNAKE_PADDING:uint = 30;
		
		private static var _instance:Zzznake;
		
		private var _gameModel:GameModel;
		private var _gameController:GameController;
		
		private var _highscoreModel:HighscoreModel;
		private var _highscoreController:HighscoreController;
		
		private var _menuController:MenuController;
		
		private var backCommand:ICommand;
		
		private var currentView:Sprite;
		
		public function Zzznake() {
			super();
			
			if(_instance) {
				throw new Error("Singleton... use getInstance()");
			} 
			_instance = this;
			
			initialize();
		}
		
		public static function getInstance():Zzznake {
			if(!_instance){
				new Zzznake();
			} 
			return _instance;
		}
		
		public function initialize():void {
			if(Multitouch.supportsTouchEvents) {
				Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			}
			
			if(!isMobile()) {
				stage.nativeWindow.activate();	
			}
			
			NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown, false, 0, true);
			
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			stage.align = StageAlign.TOP;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			if(stage.stageWidth > ZZZNAKE_WIDTH) {
				x = (stage.stageWidth - ZZZNAKE_WIDTH) / 2;
			}
			
			backCommand = new ExitGameCommand();
				
			_gameModel = new GameModel();
			_gameController = new GameController(gameModel);
			
			_highscoreModel = new HighscoreModel();
			_highscoreController = new HighscoreController(highscoreModel);
			
			_menuController = new MenuController();
			showMenu();
		}
		
		protected function onKeyDown(event:KeyboardEvent):void {
			if( event.keyCode == Keyboard.BACK ) {
				event.preventDefault();
				event.stopImmediatePropagation();
				ExecuteCommand(backCommand);
			}
		}
		
		public function showMenu():void {
			Jukebox.getInstance().play(SoundFile.THEME);
			setView(menuController.getView());
		}
		
		public function setView(sprite:Sprite):void {
			if(currentView !== null && contains(currentView)) {
				removeChild(currentView);
			}
			addChild(sprite);
			currentView = sprite
		}
		
		public function setBackCommand(command:ICommand):void {
			backCommand = command;
		}
		
		public function ExecuteCommand(command:ICommand):void {
			command.execute();
		}

		public function get gameModel():GameModel {
			return _gameModel;
		}

		public function get gameController():GameController {
			return _gameController;
		}

		public function get highscoreModel():HighscoreModel {
			return _highscoreModel;
		}

		public function get highscoreController():HighscoreController {
			return _highscoreController;
		}

		public function get menuController():MenuController {
			return _menuController;
		}
		
		public static function isAndroid():Boolean {
			return (Capabilities.version.substr(0,3) == "AND");
		}
		
		public static function isIOS():Boolean {
			return (Capabilities.version.substr(0,3) == "IOS");
		}
		
		public static function isMobile():Boolean {
			return (isAndroid() || isIOS());
		}
		
		private function deactivate(e:Event = null):void {
			NativeApplication.nativeApplication.exit();
		}
	}
}